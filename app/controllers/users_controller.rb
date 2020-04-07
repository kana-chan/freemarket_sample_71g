class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    @user.update(user_icon_params)
    redirect_to user_path
  end

private
  def user_icon_params
    params.require(:user).permit(
      :nickname,
      :email,
      :first_name,
      :last_name,
      :first_furigana,
      :last_furigana,
      :birthday,
      :image,
      :phone_number,
      :gender,
      :assessment,
      :profile,
      :favorite,
      :encrypted_password,
      :reset_password_token,
      :reset_password_sent_at,
      :remember_created_at,
      :created_at,
      :updated_at
      )
  end
end
