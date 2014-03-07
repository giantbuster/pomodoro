class SessionsController < ApplicationController
  def new
    redirect_to user_path(session[:user_id]) if signed_in?
  	@user = User.new
  end

  def create
  	@user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  	if @user == false || @user.nil?
  		redirect_to :back, flash: {errors: ["Either your password is wrong or you never registered."]}
  	else
  		sign_in(@user)
  		redirect_to user_path(@user.id)
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

  def about
  end
end
