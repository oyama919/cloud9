Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
    }

    resources :blogs do #, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :comments
      collection do
        post :confirm
      end
    end


    resources :contacts, only: [:index, :new, :create] do
      collection do
        post :confirm
      end
    end

    resources :users, only: [:index, :show]

    resources :relationships, only: [:create, :destroy]

   root 'top#index'

   if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end

end
