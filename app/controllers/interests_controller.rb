class InterestsController < ApplicationController

  before_action :require_authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @interests = Interest.all
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.valid?
      @interest.save
      redirect_to @interest
    else
      render 'new'
    end
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])
    @interest.update(interest_params)
    redirect_to @interest
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to interests_path
  end

  def select
    @interests = Interest.all
  end

  def save_prefs
    current_user.update_interests(params)
    redirect_to user_path(current_user)
  end

  private
  def interest_params
    return params.require(:interest).permit(:name, :description)
  end

end
