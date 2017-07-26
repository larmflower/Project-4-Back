class User < ApplicationRecord
  has_secure_password validations: false
  mount_uploader :image, ImageUploader
  has_friendship
  has_and_belongs_to_many :posts_liked, class_name: 'Post', join_table: 'posts_users'
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present? || facebook_id.present? || instagram_id.present?
    # google_id.present?
  end

end
