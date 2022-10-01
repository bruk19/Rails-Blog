class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create
    @like.user = current_user
    @like.post = @post
    if @like.save
      flash[:success] = 'Like Added successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'An Error occurred: Like could not be saved'
    end
  end
end
