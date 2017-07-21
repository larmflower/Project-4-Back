Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :comments
    resources :posts
    post 'requestfriend', to: 'users#friend_request'
    put 'acceptfriend', to: 'users#accept_request'
    put 'declinefriend', to: 'users#decline_request'
    put 'removefriend', to: 'users#remove_friend'
  end
end
