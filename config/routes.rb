Rails.application.routes.draw do
  resource :posts do
    resources :comments
  end
  get '/posts/:post_id/comments' => 'comments#index'

  # get '/stories/:kinja_id' => 'stories#show'
  root "posts#index"
end
