class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find_by_id(params[:id])

    # create array containing user and all friends
    @user_and_friends = []
    @user_and_friends << current_user
    current_user.friends.each do |friend|
      @user_and_friends << friend
    end

    # check if newer post is nil and if user is in array
    @newer_post = @post
    while !@newer_post.newer.nil? && @user_and_friends.include?(@newer_post.newer.user) do
      @newer_post = @newer_post.newer
      break if @newer_post != @post
    end

    # check if older post is not nil and if user is in array
    @older_post = @post
    while !@older_post.older.nil? && @user_and_friends.include?(@older_post.older.user) do
      @older_post = @older_post.older
      break if @older_post != @post
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
