class User < ActiveRecord::Base

  has_many :books, dependent: :nullify
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :nullify
  has_many :liked_books, through: :likes, source: :book
  has_many :liked_reviews, through: :likes, source: :review
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
