class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit #編集する
    
  end
  
  def update #更新する
     
    if @user.update(profile_params)
      flash[:success] = "Update!"
      redirect_to @user 
    else
      render 'edit'
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location, :introduction)
  end
  
  def profile_params
    params.require(:user).permit(:name, :email, :location,
                                  :introduction)
  end
end
