Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
  # Ресурс вопросов, вложенный в ресурс тестов
  resources :tests do
    resources :questions, shallow: true
  end
end
