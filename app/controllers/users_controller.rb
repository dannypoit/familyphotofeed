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

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :avatar)
  end
end
