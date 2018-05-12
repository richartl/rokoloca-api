Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  # Swagger Docs
  get '/apidoc' =>
  redirect('/swagger/dist/index.html?url=/docs')

  get '/docs', to: 'doc#index'
  namespace :api do
    namespace :v1 do
      resources :playlists, controller: 'playlists'
    end
  end
end
