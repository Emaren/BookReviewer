class Review < ActiveRecord::Base

    belongs_to :book
    belongs_to :user

    has_many :likes
    has_many :liking_users, through: :likes, source: :user




end
