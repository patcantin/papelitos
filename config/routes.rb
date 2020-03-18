Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create, :update] do
    resources :game_words, only: %i(new create)
    resources :game_teams, only: %i(update)
    resources :game_users, only: %i(index new create destroy)
  end
end
