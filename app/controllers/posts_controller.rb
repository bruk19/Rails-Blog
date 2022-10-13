class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find_by(params[:authorId])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'New Post created successfully'
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'An error occurred : Post could not be created'
        end
      end
    end
  end

  def destroy
    @status_update = Post.find(params[:id])
    if @status_update.present?
      @status_update.destroy
    end
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
