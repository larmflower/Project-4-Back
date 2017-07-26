class Post < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
=======
  has_many :comments, dependent: :destroy

  scope :of_friends, -> (friends) {where user_id: friends }
  scope :of_me, -> (current_user) {where user_id: current_user }
>>>>>>> development
end
