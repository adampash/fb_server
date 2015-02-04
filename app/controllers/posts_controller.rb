class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:comments).page(params[:page] || 1)
  end

  def show
    @post = Post.find params[:id]
  end

  def search
    type = 'normal'
    @query = query_string = params[:query]
    if @query.match(/^name:(.+)/)
      query_string = query_string.match(/^name:(.+)/)[1]
      type = 'name'
    end
    query = "%#{query_string.downcase}%"
    if type == 'normal'
      posts = Post.where('LOWER(message) LIKE ?', query)
      comments = Comment.where('LOWER(message) LIKE ?', query)
    elsif type == 'name'
      posts = Post.where('LOWER(from_name) LIKE ?', query)
      comments = Comment.where('LOWER(from_name) LIKE ?', query)
    end
    all_results = (posts + comments).sort_by { |obj| obj.created_time }.reverse
    @results = Kaminari.paginate_array(all_results).page(params[:page] || 1)
  end
end
