Rails.application.routes.draw do
  root  'static_pages#home'
  get   '/help'     =>  'static_pages#help'
  get   '/about'    =>  'static_pages#about'
  get   '/contact'  =>  'static_pages#contact'

  #User routes
  get     '/signup'   =>  'users#new'
  post    '/signup'   =>  'users#create'
  get     '/login'    =>  'sessions#new'
  post    '/login'    =>  'sessions#create'
  delete  '/logout'   =>  'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :workouts do
    resources :exercises do
      resources :exercise_sets, as: :sets
    end
  end
  resources :workout_types
  resources :body_parts
end
