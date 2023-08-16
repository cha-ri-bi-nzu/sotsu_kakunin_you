Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show]

  resources :groups, only: %i[new create show edit update destroy] do
    patch :change_owner, path: '/:user_id/owners/'
    patch :invalid, path: '/invalids/'
  end
  resources :groupings, only: %i[index create update destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
