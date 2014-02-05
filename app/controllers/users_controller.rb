class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      redirect_to :back, flash: {errors: @user.errors.full_messages}
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @log = Log.new
    @logs = current_user.logs.order("created_at DESC").where("result IS NOT NULL").all
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:display_name, :email, :password, :password_confirmation)
  end
end



# puts "==================================="
# puts "PARAMS:"
# puts params
# puts "==================================="