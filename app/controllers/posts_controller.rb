class PostsController < ApplicationController



 def secret
 end

 def index
   @posts = Post.all
 end

 def show
   @post = Post.find(params[:id])
 end

 def new
   @post = Post.new
 end

 def edit
   @post = Post.find(params[:id])
 end

 def create
   @post = current_user.posts.new(post_params)
   if @post.save
     redirect_to @post
   else
     redirect_to :new
   end
 end

 def update
   @post = Post.find(params[:id])

   if @post.update_attributes(post_params)
     redirect_to :post
   else
     render :edit
   end
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end




private
def post_params
 params.require(:post).permit(:title, :content)
end



end
