Rails.application.routes.draw do

  devise_for :users
   resources :blogs do #, only: [:index, :new, :create, :edit, :update, :destroy] do
     collection do
        post :confirm
     end
   end
        
   resources :contacts, only: [:index, :new, :create] do
     collection do
       post :confirm
     end
   end
   
   root 'top#index'
   
end