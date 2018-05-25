Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations'
    # sessions:  'api/v1/sessions',
    # passwords:  'api/v1/passwords'
  }

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      # get    'versions/state'       => 'versions#state'
      # post   'users/login'          => 'sessions#create'
      # delete 'users/logout'         => 'sessions#destroy'
      # post   'users/reset_password' => 'users#reset_password'
      # resources :users, only: [:create, :destroy]
      devise_scope :user do

        resources :products, only: [:index, :show]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  apipie
end
