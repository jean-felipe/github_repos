Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/search', to: 'home#index'

  namespace :api do
    namespace :v1 do
      get 'search', to: "searches#search_repository_by_user"
      post 'save-repo', to: "searches#save_repository"
    end
  end
end
