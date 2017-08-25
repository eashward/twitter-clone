class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = post_service.create_post(post_params)
    respond_to do |f|
      f.html {redirect_to "", notice: "post created!"}
    end

  end
end

private
  def post_params
    params.require(:post).permit(:user_id, :comment)
  end