Rails.application.routes.draw do
  get '/posts/:post_id/comments' => 'comments#index'
  get '/posts/:id' => 'posts#show'
  get '/search/:query' => 'posts#search'

  root "posts#index"
end
