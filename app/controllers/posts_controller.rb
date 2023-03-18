class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(allowed_post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path(@post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private

  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end
end
