Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  unauthenticated :user do
    devise_scope :user do
      root 'landing#index', as: :unauthenticated_root
    end
  end
  
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end
end
