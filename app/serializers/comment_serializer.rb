class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :user
  has_one :post
  has_one :user
end
