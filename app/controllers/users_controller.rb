class UsersController < ApplicationController
  def show
    posts = Post.where(from_id: params[:id])
    comments = Comment.where(from_id: params[:id])

    if posts.length > 0
      @user_name = posts.first.from_name
    else
      @user_name = comments.first.from_name
    end

    all_results = (posts + comments).sort_by { |obj| obj.created_time }.reverse
    @results = Kaminari.paginate_array(all_results).page(params[:page] || 1)
    render "posts/search"
  end
end
