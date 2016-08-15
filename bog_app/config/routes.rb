Rails.application.routes.draw do
  root "creatures#index"
  get "/creatures", to: "creatures#index", as: "creatures"
  get "/creatures/:id", to: "creatures#new"
end
