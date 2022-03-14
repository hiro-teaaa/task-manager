Rails.application.routes.draw do
  resources :tasks, :task_labels
  root "tasks#index"
  get 'tasks/new', :to => 'tasks#new'
  get 'task/:id', :to => 'task#show'
  get 'tasks/:id/edit', :to => 'tasks#edit'
  get 'tasks/:id/destroy', :to => 'tasks#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
