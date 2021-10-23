class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(uid: params[:user][:uid],pass: params[:user][:pass])
    if @user.valid?
      flash[:notice] = 'ユーザーの登録に成功しました。'
      
      @user.pass = BCrypt::Password.create(params[:user][:pass])
      @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
