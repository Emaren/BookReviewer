class Review < ActiveRecord::Base

    belongs_to :book
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

    has_many :votes, dependent: :destroy
    has_many :voting_users, through: :votes, source: :user



end
