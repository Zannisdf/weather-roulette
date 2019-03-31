Rails.application.routes.draw do
  resources :players, only: %i[index new create]
end
