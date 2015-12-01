class Book < ActiveRecord::Base

    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_many :liked_reviews, through: :reviews, source: :user
    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user
    has_many :favourites, dependent: :destroy
    has_many :favouriting_users, through: :favourites, source: :user


    has_attached_file :book_img, styles: { book_index: "250x350>", :book_show => "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\Z/


      validates :title,      {presence: true,
                              uniqueness: {message: "Title currently exists"},
                              length:     {minimum: 1}}

      validates :description, {presence: true,
                              uniqueness: {scope: :title},
                              length:     {minimum: 1}}



    def liked_by?(user)
      # likes.find_by_user_id(user.id).present?
      like_for(user).present?
    end

    def like_for(user)
      likes.find_by_user_id(user.id)
    end

    def favourited_by?(user)
      favourite_for(user).present?
    end

    def favourite_for(user)
      favourites.find_by_user_id(user.id)
    end



end
