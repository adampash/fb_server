Rails.application.routes.draw do
  get '/posts/:post_id/comments' => 'comments#index'
  get '/posts/:id' => 'posts#show'

  root "posts#index"
end
