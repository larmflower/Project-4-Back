class User < ApplicationRecord
  has_secure_password validations: false
  mount_uploader :image, ImageUploader
  has_friendship
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?

  def oauth_login?
    github_id.present? || facebook_id.present? || instagram_id.present?
    # google_id.present?
  end

end
