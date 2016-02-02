Rails.application.routes.draw do
  root to: redirect('steps/personal_info')
  resources :steps
  resources :people, only: :show
end
