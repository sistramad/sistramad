Rails.application.routes.draw do
  
  resources :formalities_documents
  resources :formalities_masters
  #resources :professors_transfers
  resources :documents
  #resources :reports
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

    resources :joint_plans do
      collection do
        post :download
        get :status
        post :decline
        post :accept
        get :informs
      end
    end

    resources :professors_transfers do
      collection do
        post :download
        get :status
        get 'get_selections', to: "professors_transfers#get_selections"
        get 'get_froms', to: "professors_transfers#get_froms"
        get 'get_to', to: "professors_transfers#get_to"
        #get :edit
      end
    end


    resources :reports

    resources :attachments do
      collection do
        post :create_inform
      end
    end

    devise_for :users
    #scope "/" do
    #  resources :users do
    # 
    #  end
    #end

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
