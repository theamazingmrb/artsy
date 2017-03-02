class UsersController < ApplicationController
  def index
    @users = User.all
  end

 def new
   @user = User.new
 end

 def show
   @user = User.find(params[:id])
   @user_posts = Post.where(user_id: @user).order("created_at DESC")
 end

 def create
   @user = User.new(user_params)
   @user.email.downcase!


   if @user.save
     session[:user_id] = @user.id.to_s

     redirect_to posts_path
   else

     render :new
   end
 end


  def user_params
    params.require(:user).permit(:f_name, :l_name, :user_name, :email, :password, :password_confirmation)
  end
end
