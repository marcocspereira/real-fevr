Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'

      resources :players, only: %i[index show create update destroy]
      resources :notifications, only: %i[index create destroy]
    end
  end
end
