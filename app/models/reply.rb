class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :repliable, polymorphic: true
end
