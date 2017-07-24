class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :first_name, :last_name, :username, :email, :password, :password_confirmation, :image, :github_id, :facebook_id, :google_id, :instagram_id, :friends, :friendships

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def image
    object.image.url
  end
end
