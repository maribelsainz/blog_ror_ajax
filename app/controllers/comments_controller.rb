class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      content: params[:comment][:content],
      post: Post.find(params[:post_id]),
      user: current_user
    )
    @comment.save
    respond_to :js
  end

end
