class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_furigana] = user_params[:last_furigana]
    session[:first_furigana] = user_params[:first_furigana]
    session[:phone_number] = user_params[:phone_number]
    session[:gender] = user_params[:gender]
    session[:birthday] = user_params[:birthday]
    session[:image] = user_params[:image]
    session[:profile] = user_params[:profile]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_furigana: session[:last_furigana],
      first_furigana: session[:first_furigana],
      phone_number: session[:phone_number],
      gender: session[:gender],
      birthday: session[:birthday],
      image: session[:image],
      profile: session[:profile],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      prefecture_id: user_params[:prefecture_id]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to controller: :items ,action: :index
    else
      render "signup/step1"
    end
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email, 
      :last_name,
      :first_name,
      :last_furigana,
      :first_furigana,
      :phone_number,
      :gender,
      :birthday,
      :image,
      :profile,
      :password, 
      :password_confirmation, 
      :prefecture_id
    )
  end
end
