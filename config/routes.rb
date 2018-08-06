Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :trainees, :skip => [:registrations]
  root 'static_pages#home'
end
