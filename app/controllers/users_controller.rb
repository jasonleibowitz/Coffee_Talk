class UsersController < ApplicationController

  before_action :require_authentication, only: [:index]

  def index
    @users = User.all
  end

  def show
    if params[:id]
      if current_user
        @user = User.find(params[:id])
        @fsearch = Foursquare.top_coffeehouses_name(@user, 5)
      else
        redirect_to '/login'
      end
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
    if current_user == @user
      @user.destroy
      redirect_to root_path
    else
      redirect_to logout_path
    end
  end

  def profile
    if current_user
      @user = User.find(current_user.id)
      @fsearch = Foursquare.top_coffeehouses_name(@user, 5)
      hello_array = ["Hello", "Shalom", "Hej", "Saluton", "Bonjour", "Guten Tag", "Aloha", "Ciao", "Konnichiwa", "Olá", "Hola", "nǐ hǎo", "Namastē", "Privet"]
      @hello = hello_array[rand(13)]
    else
      redirect_to '/login'
    end
  end

  private
  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :dob, :zipcode, :password, :password_confirmation, :admin, :profile_pic, :about)
  end

  def edit_user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :dob, :zipcode, :admin, :profile_pic, :about)
  end

end
