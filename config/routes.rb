Rails.application.routes.draw do
  resources :tasks, :task_labels
  root "tasks#index"
  get 'tasks/new', :to => 'task#new'
  get 'task/:id', :to => 'task#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
