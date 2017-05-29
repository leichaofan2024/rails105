Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "quizzes#index"
  resources :groups do
    collection do
      get :game
      get :beauty
      get :art
    end
    member do
      post :join
      post :quit
    end
    resources :posts
  end
  namespace :account do
    resources :groups
    resources :posts
  end

  resources :quizzes do
    resources :questions
  end
  resources :answers do
    member do
      post :set_as_correct
      post :set_as_wrong
    end
  end
  
end
