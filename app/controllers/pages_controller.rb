class PagesController < ApplicationController

  before_action :build_post
  def index

  end

  def home
    @posts = post_service.get_following_users_post(current_user)

  end

  def profile
    begin
      @user = User.find_by_username(params[:username])
    rescue
      redirect_to root_path, notice: "user not found"
    end
    @posts = post_service.get_user_posts(@user)
  end

  def explore
    @posts = Post.try(:all)
  end

  def build_post
    @newpost = post_service.build_post
  end

end