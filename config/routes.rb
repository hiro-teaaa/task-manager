Rails.application.routes.draw do
  resources :tasks, :task_labels
  root "tasks#index"
  get 'tasks/new', :to => 'tasks#new'
  get 'tasks/:id/edit', :to => 'tasks#edit'
  get 'tasks/:id/destroy', :to => 'tasks#destroy'

  get 'labels/index', :to => 'labels#index'
  get 'labels/new', :to => 'labels#new'
  get 'labels/:id/edit', :to => 'labels#edit'
  get 'labels/:id/destroy', :to => 'labels#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
