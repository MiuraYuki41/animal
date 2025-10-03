class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correst_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to user_path(@user.id) 
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @user.destroy
    sign_out
    redirect_to new_user_registration_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :body)
  end

  def correst_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
end
