class Review < ActiveRecord::Base

    belongs_to :product
    belongs_to :user

    validates :product, :user_id, :description, :rating, presence: true


end
