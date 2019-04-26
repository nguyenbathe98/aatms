Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  devise_for :trainees
  devise_for :trainers
  namespace :trainee do
  	resources :courses, only:[:show] do
  		resources :subjects, only:[:index, :show, :update]
  	end
  end
  namespace :trainer do
  	resources :courses do
    	resources :subjects
      resources :assign_trainees
      resources :assign_trainers
      resources :course_subjects
    end
  end
  namespace :supervisor do
  	resources :subjects
  end
end
