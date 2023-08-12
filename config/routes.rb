Rails.application.routes.draw do
  resources :chapters

  get '/courses/:id/chapters', to: 'chapters#show_from_course'


  # resources :courses

  get '/users', to: 'api/v1/users#index'
  get '/users/:id', to: 'api/v1/users#getone'
  delete '/users/:id', to: 'api/v1/users#destroy'
  put '/users/:id', to: 'api/v1/users#update'

  get '/courses/:id', to: 'api/v1/courses#show'
  get '/courses', to: 'api/v1/courses#index'
  post '/courses', to: 'api/v1/courses#create'
  delete '/courses/:id', to: 'api/v1/courses#destroy'
  put '/courses/:id', to: 'api/v1/courses#update'

  get '/topics', to: 'api/v1/courses#topics'
  get '/topics/:title', to: 'api/v1/courses#topic'

  get '/subtopics', to: 'api/v1/courses#subtopics'
  get '/subtopics/:title', to: 'api/v1/courses#subtopic'

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
