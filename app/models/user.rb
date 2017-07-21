class User < ApplicationRecord
  has_secure_password validations: false
  has_friendship
  has_many :posts
  has_many :comments

  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present?
    facebook_id.present?
    instagram_id.present?
    google_id.present?
  end

end
