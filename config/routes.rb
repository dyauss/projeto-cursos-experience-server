Rails.application.routes.draw do

  get '/users', to: 'api/v1/users#index'
  delete '/users/:id', to: 'api/v1/users#destroy'
  put '/users/:id', to: 'api/v1/users#update'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end