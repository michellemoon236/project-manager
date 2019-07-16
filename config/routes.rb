Rails.application.routes.draw do
  # devise_for :users, :controllers => {registrations: 'registrations' }
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :projects do 
    resources :tasks
  end

  get 'tasks/:id/complete', to: "tasks#task_complete", as: 'task_complete'
end
