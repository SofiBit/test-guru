Rails.application.routes.draw do
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
  # Ресурс вопросов, вложенный в ресурс тестов
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end
end
