Rails.application.routes.draw do
  root 'debt_calc#main'

  resources :payments
  resources :credits
  resources :debtors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
