class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :image, :github_id, :facebook_id, :google_id, :instagram_id, :friends, :friendships
end
