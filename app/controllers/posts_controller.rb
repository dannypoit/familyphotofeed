class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find_by_id(params[:id])

    @newer_post = @post.newer
    if ! @newer_post.newer.nil?
      while @newer_post.user != current_user || ! @newer_post.user.friends_with?(current_user)
        @newer_post = @newer_post.newer
      end
    end

    @older_post = @post.older
    if ! @older_post.older.nil?
      while @older_post.user != current_user || ! @older_post.user.friends_with?(current_user)
        @older_post = @older_post.older
      end
    end

    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user && @post.user.friends_with?(current_user) == false
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
  end

  def update
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
    @post.update_attributes(post_params)
    if @post.valid?
      redirect_to post_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:photo, :caption)
  end
end
