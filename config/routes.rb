Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :customers do
    collection do
      post 'send_to_everyone'
    end
    member do
      post 'send_to_someone'
    end
  end
end
