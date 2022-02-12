Rails.application.routes.draw do
  resource :homes, only: :show
  resource :no_ext, only: :show
  resource :use_jpeg, only: :show
  resources :start_with_assets, only: :index
  root to: 'homes#show'
end
