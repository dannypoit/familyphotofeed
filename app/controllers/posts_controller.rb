class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find_by_id(params[:id])

    # create array containing user and all friends
    user_and_friends = []
    user_and_friends << current_user
    current_user.friends.each do |friend|
      user_and_friends << friend
    end

    # all allowed posts for user
    allowed_posts = Post.order(created_at: :desc).reject { |post| !user_and_friends.include?(post.user) }

    @newer_post = allowed_posts.select{|post| post.id > @post.id}.last
    @older_post = allowed_posts.select{|post| post.id < @post.id}.first

    return render_not_found if @post.blank?
    return render_not_found(:forbidden) if @post.user != current_user && @post.user.friends_with?(current_user) == false
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
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
