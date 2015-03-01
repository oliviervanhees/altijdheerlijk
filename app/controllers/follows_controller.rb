class FollowsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    if @user.present?
      current_user.follow!(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      follow = current_user.follows.get_follow(@user).first if current_user.follows
      if follow
        follow.destroy
      end
    end
    respond_to do |format|
      format.js { render :file => "/follows/create", :handlers => [:erb] }
    end
  end	
end
