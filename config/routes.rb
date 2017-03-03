Rails.application.routes.draw do

  resources :documents
  resources :procedures
  resources :university_degrees
  resources :universities
  resources :faculties
  resources :roles
  resources :employees
  resources :countries do
    collection do
      get :insert_records
    end
  end

  devise_for :users

  localized do
    resources :users
    resources :references
    resources :reference_lists
  end

  # get 'inicio/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'inicio#index'

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
