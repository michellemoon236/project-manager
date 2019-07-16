Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks" }

  root to: 'application#home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :projects do 
    resources :tasks
  end

  get 'tasks/:id/complete', to: "tasks#task_complete", as: 'task_complete'
end
