Rails.application.routes.draw do
  root :to => "rooms#index"
  resources :rooms

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  get 'api/bbb_itegration/join'
end
