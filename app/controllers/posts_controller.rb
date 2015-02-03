class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:comments).page(params[:page] || 1)
  end

  def show
    @post = Post.find params[:id]
  end

  def search
    @query = params[:query]
    query = "%#{@query.downcase}%"
    @posts = Post.where('LOWER(message) LIKE ?', query).page(params[:page] || 1)
    render :index
  end
end
