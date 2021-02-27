class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
  	@posts = Post.page(params[:page]).reverse_order
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:title, :text, :image, :user_id)
  end

end
