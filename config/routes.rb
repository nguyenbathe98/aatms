Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :trainees, :skip => [:registrations]
  devise_for :trainers, :skip => [:registrations]
  root 'static_pages#home'
  resources :courses do
    resources :subjects
  end
end
