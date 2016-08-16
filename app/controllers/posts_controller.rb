class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if @post.save(post_params)
      flash[:notice] = "Post created."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post failed."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated."
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Post update failed."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post deleted."
      redirect_to posts_path
    else
      flash[:alert] = "Post deletion failed."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
