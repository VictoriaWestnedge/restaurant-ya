Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :restaurants do
		resources :schedules, only: [:new, :create]
		resources :foods, only: [:new, :create]
	end

end
