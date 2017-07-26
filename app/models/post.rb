class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :posts_liked, class_name: 'User', join_table: 'posts_users'


  scope :of_friends, -> (friends) {where user_id: friends }
  scope :of_me, -> (current_user) {where user_id: current_user }
end
