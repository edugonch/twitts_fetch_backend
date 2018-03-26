Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'

  mount Sidekiq::Web => '/sidekiq'
  

  mount Swaggard::Engine, at: '/api_docs/swagger/'

  namespace :api do
    namespace :v1 do
      get "twitts/:hashtags", to: "twitts#index"
    end
  end
end
