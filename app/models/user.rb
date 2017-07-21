class User < ApplicationRecord
  has_friendship
  has_many :posts
  has_many :comments
end
