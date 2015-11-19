class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :review

  validates :book_id, uniqueness: {scope: :user_id}

end
