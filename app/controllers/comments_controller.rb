class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])

    respond_to do |format|
      format.html { render @comments, layout: false }
      format.json { render json: @comments }

    end
  end
end

