Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists do
    resources :bookmarks, only: %i[new create] # nested resource
  end
  resources :bookmarks, only: :destroy # non-nested resource
end
