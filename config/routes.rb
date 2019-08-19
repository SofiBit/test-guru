Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  resources :users, only: :create
  resources :sessions, only: :create

  # Ресурс вопросов, вложенный в ресурс тестов
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  #GET /test_passages/:id/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
