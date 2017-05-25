Rails.application.routes.draw do
  get '/albums/search' => 'albums#search'
  post 'albums/searchAlbum' => 'albums#searchAlbum'

  resources :customers
  resources :albums do
    resources :songs
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :categorie, :defaults => { :format => :json } do
      resources :product, :defaults => { :format => :json }
    end
  end
end
