class User < ApplicationRecord
  belongs_to :city
  has_many :replies
  has_many :comments
  has_many :posts
  has_many :tags
  has_many :likes
end
