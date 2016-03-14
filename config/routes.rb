MonerisSimulator::Engine.routes.draw do
  resources :credit_cards, only: :new
end
