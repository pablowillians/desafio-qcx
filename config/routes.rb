Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/webhook", to: "webhook#index"
  get "/issues/:issue_number/events", to: "issue_events#index"
end
