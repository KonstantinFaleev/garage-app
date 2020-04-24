Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :users do
    resources :lists do
      resources :tasks do
        member do
          put :task_up
          put :task_down
          patch :done
          patch :deadline
          get :deadline
        end
      end
    end
  end

  resources :lists do
    resources :tasks do
    end
  end
end
