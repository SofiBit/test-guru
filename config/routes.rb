Rails.application.routes.draw do

  devise_for :users,
              path: :gurus,
              path_names: { sign_in: :login, sign_out: :logout },
              controllers: { sessions: 'users/sessions' }

  root 'tests#index'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, only: :index do
    post :start, on: :member
  end

  #GET /test_passages/:id/result
  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :tests do

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
