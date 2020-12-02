class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find_by_id(params[:post_id])
    return render_not_found if @post.blank?
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
