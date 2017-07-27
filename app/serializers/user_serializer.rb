class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :first_name, :last_name, :username, :email, :image, :github_id, :instagram_id, :facebook_id, :google_id, :friends, :friendships, :posts_liked
  has_many :comments

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def image
    object.image.url
  end
end
