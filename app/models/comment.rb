class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :replies, as: :repliable
  has_many :likes, as: :imageable
end
