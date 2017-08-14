class PagesController < ApplicationController
  def index

  end

  def home
    @posts = Post.all
    @newpost = Post.new

  end

  def profile
    begin
      @user = User.find_by_username(params[:username])
    rescue
      redirect_to root_path, notice: "user not found"
    end
    @posts = Post.where("user_id = ?", @user.try(:id))
    @newpost = Post.new

  end

  def explore
    @posts = Post.try(:all)

  end

end