Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
end
