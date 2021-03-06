Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  unauthenticated :user do
    devise_scope :user do
      root 'landing#index', as: :unauthenticated_root
      post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'
    end
  end
  
  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  resources :projects do
    member do
      get '/deprecated_tasks', to: 'projects#deprecated_tasks', as: :deprecated_tasks
    end
    resources :labels, only: :show
    resources :tasks do
      resources :comments, except: [:new, :edit]
    end
    resources :invites, only: :create
  end

  namespace :admin do
    resources :users
    resources :tasks
    resources :projects
    resources :labels
    resources :invites
    resources :project_members

    root to: "users#index"
  end
end
