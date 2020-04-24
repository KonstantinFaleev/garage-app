Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/edit'
  get 'lists/create'
  get 'lists/update'
  get 'lists/destroy'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/done'
  get 'tasks/task_up'
  get 'tasks/task_down'
  get 'tasks/destroy'
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
