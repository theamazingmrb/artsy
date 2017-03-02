class PostsController < ApplicationController



 def secret
 end

 def index
   @posts = Post.all.order("created_at DESC")
 end

 def show
   @post = Post.find(params[:id])
   @comments = Comment.where(post_id: @post).order("created_at DESC")
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
 params.require(:post).permit(:title, :content, :image)
end



end
