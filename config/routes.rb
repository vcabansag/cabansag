Cabansag::Application.routes.draw do

  resources :pages

  get '/videos' => 'pages#videos', as: :videos

  root to: 'pages#videos'

end
