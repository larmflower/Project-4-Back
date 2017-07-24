class PostSerializer < ActiveModel::Serializer
  attributes :id, :headline, :src, :categories, :image, :description
  has_one :user

  def image
    object.image.url
  end
end
