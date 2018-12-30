class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?

    @post.update_attributes(post_params)

    if @post.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:caption)
    end

    def render_not_found
      render plain: 'Not found', status: :not_found
    end
end
