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
    posts = Post.where('LOWER(message) LIKE ?', query)
    comments = Comment.where('LOWER(message) LIKE ?', query)
    all_results = (posts + comments).sort_by { |obj| obj.created_time }.reverse
    @results = Kaminari.paginate_array(all_results).page(params[:page] || 1)
  end
end
