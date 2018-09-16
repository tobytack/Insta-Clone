Rails.application.routes.draw do

  root to: 'blogs#top'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end

end
