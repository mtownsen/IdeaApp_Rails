Rails.application.routes.draw do
  resources :organizations
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }

	get '/send_password' => "users#reset_password"  
end
