Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
      controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
      }
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"

      resources :players, only: %i[index]
    end
  end
end
