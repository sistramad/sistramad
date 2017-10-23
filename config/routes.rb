Rails.application.routes.draw do

  resources :groups
  resources :user_groups, except: [:show, :edit, :update]
  resources :documents

  resources :procedures do
    member do
      get :validate
      get :show_requirements
    end
  end
  
  #get 'special_formation', to: 'procedures#special_formation'

  resources :admin_procedures do
    member do
      get :show
      get :show_initial_requirements
      get :approve_initial_requirements
      get :approve_document
      get :show_document
      get :approve_step
      get :approve_procedure
      post :approve_procedure
      get :complete
      post :complete
      get :generate_approval_document
      get :download_all_documents
      get :check_initial_requirements
      post :save_opinion
      get :deny_step
      post :deny_step
    end
  end

  resources :special_formation_procedures do
    member do
      get :validate
      get :show_requirements
    end
  end
  
  resources :rotation_plans do
    member do
      get :validate
      get :show_requirements
      get :show_participants
      get :add_participants
      get :search_users
      post :add_user
    end
  end

  resources :modify_rotation_plans do
    member do
      get :validate
      get :show_requirements
      get :show_participants
    end
  end

  resources :delay_rotation_plans do
    member do
      get :validate
      get :show_requirements
      get :show_participants
    end
  end

  resources :licenses do
    member do
      get :validate
      get :show_requirements
      post :fill_info
    end
  end

  resources :delay_licenses do
    member do
      get :validate
      get :show_requirements
      post :fill_info
    end
  end

  resources :license_reincorporations do
    member do
      get :validate
      get :show_requirements
    end
  end

  resources :license_infos, only: [:edit, :update]

  resources :participants

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

  #Routes de Luis

  resources :extensions
  resources :joint_plans do
    collection do
        post :download
        get :status
        post :decline
        post :accept
        post :view
        get :inform
        get :inform_list
        get :extension
    end
  end

  resources :notifications
  resources :reports
  resources :attachments do
    collection do
      post :create_inform
    end
  end

  mount ActionCable.server => '/cable'
  #mount Sidekiq::Web => '/sidekiq'

end
