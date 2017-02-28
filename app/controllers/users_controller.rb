class UsersController < ApplicationController
  def index
    @users = User.all
  end

 def new
   @user = User.new
 end

 def show
   @user = User.find(params[:id])
 end

 def create
   @user = User.new(user_params)
   @user.email.downcase!

   if @user.save
     flash[:notice] = "Account created successfully you peasant!"
     redirect_to users_path
   else

     flash.now.alert = "you failed at creating an acount you peasant!"
     render :new
   end
 end


  def user_params
    params.require(:user).permit(:f_name, :l_name, :user_name, :email, :password, :password_confirmation)
  end
end
