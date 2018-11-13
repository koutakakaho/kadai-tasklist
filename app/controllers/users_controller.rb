class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :index]
  def index
    @users = User.all.page(params[:page])
  end

  # def show
  #   user = User.find(params[:id])
  #   unless user==current_user
  #     redirect_to root_url
  #   end
  # end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="サインインしました"
      redirect_to @user
    else
      render "new"
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
