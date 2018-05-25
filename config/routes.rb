Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations'
    # sessions:  'api/v1/sessions',
    # passwords:  'api/v1/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  apipie
end
