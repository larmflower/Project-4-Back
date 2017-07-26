class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :of_friends, -> (friends) {where user_id: friends }
  scope :of_me, -> (current_user) {where user_id: current_user }
end
