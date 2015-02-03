class PostsController < ApplicationController
  def index
    @posts = Post.limit(20).includes(:comments)
  end
end
