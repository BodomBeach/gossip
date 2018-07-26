class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :replies, as: :repliable
  has_many :likes, as: :imageable
end
