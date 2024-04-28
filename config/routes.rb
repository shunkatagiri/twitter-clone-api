Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :tweets
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
