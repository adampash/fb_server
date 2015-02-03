class PostsController < ApplicationController
  def index
    @posts = Post.limit(20).includes(:comments)
  end

  def show
    @post = Post.find params[:id]
  end
end
