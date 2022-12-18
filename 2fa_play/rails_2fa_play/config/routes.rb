Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resource :home, only: %I[index]
  patch '/home/setup_2fa' => 'home#setup_2fa', as: :setup_2fa_home
  root "home#index"
end
