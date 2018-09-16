Rails.application.routes.draw do

  resources :feeds
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
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
