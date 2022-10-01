class PostsController < ApplicationController
  def index
    @user = User.find(params[:authorId])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end
