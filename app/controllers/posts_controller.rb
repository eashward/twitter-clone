class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    respond_to do |f|
      f.html {redirect_to "", notice: "post created!"}
    end

  end
end

private
  def post_params
    params.require(:post).permit(:user_id, :comment)
  end