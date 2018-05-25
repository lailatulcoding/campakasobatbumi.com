Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Monologue::Engine, at: '/blog' # or whatever path, be it "/blog" or "/monologue"
end
