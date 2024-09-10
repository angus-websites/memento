Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "no_word", to: "errors#no_word", as: :no_word

  # Add a resourceful route for words
  resources :words, only: [ :show, :index ]

  # Defines the root path route ("/") - show word of the day
  root "words#day"
end
