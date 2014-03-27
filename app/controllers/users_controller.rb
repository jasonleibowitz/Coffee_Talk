class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find(current_user.id)
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(edit_user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user
      @user.destroy
      redirect_to root_path
    else
      redirect_to logout_path
    end
  end

  private
  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :dob, :zipcode, :password, :password_confirmation, :admin)
  end

  def edit_user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :dob, :zipcode, :admin)
  end

end
