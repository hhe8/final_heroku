class FollowsController < ApplicationController
  before_action :require_login

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "Please login."
    end
  end

  def index
  end

  def create
      follower= User.find_by(id: params[:id].to_i)
    if !@user.followers.find_by(id: params[:id].to_i)
      f = Follow.new
      f.follower_id = follower.id
      f.followee_id = @user.id
      f.save
      flash[:notice] = "Followed #{follower.name} successfully!"
    else
      flash[:notice] = "Already followed #{follower.name}."
    end
    redirect_to follows_path
  end

  def destroy
    follow = Follow.find_by(follower_id: params["id"].to_i, followee_id: @user.id)
    Follow.delete(follow.id)
    flash[:notice] = "Unfollowed successfully!"
    redirect_to '/follows'
  end
end
