require 'sidekiq/web'

Rails.application.routes.draw do  
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'

      resources :players, only: %i[index show create update destroy] do
        post 'subscribe', to: 'players#subscribe'
      end
      resources :notifications, only: %i[index show create update destroy]
    end
  end
end
