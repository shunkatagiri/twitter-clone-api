Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :tweets
      get '/me', to: 'users#me'
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
