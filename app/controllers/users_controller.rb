class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def homepage
  end

  def new
     @user = User.new
  end

  def create
      @user = User.new
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end

  end

  def show
    @user = User.find(params[:id])
  end

  private


  private 


  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
