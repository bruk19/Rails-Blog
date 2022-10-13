class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'New Comment created successfully'
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = 'An error occurred : Comment could not be created'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @status_update = Comment.find(params[:id])
    @status_update.destroy if @status_update.present?
    redirect_to user_post_path(post.user.id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
