class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
    return render_not_found(:forbidden) if @user != current_user
    @user.update_attributes(user_params)
    if @user.valid?
      redirect_to user_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def change_avatar
    @user = User.find(params[:id])
  end

  def invite
    @user = User.find(params[:id])

    @users = User.all
    @search = params['search']
    if @search.present?
      @email = @search['email']
      @users = User.where("email ILIKE ?", @email)
    end
  end

  def invite_to_family
    @user = User.find(params[:id])
    user_to_invite = @found_user
    @user.friend_request(user_to_invite)
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :avatar)
  end
end
