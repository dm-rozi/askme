Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/show'
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :questions

  root to: 'users#index'
  # get 'show' => 'users#show'
end
