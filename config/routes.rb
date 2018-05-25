Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#landing'
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations'

  }
  resources :products, only: :index
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      devise_scope :user do
        resources :products, only: [:index, :show]
        resources :feedbacks, only: [:create]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Monologue::Engine, at: '/blog' # or whatever path, be it "/blog" or "/monologue"

  apipie

end
