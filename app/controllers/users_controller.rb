class UsersController < ApplicationController

def show
	@user = User.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml  { render :xml => @user }
	end
end

def index
    @user = User.all.order("updated_at DESC")
  	end

def my_friends
	@user = User.all.order("updated_at DESC")
  	end

def like
	@user.liked_by current_user
	redirect_to :back
end

def unlike
	@user.unliked_by current_user
	redirect_to :back
end



  end
