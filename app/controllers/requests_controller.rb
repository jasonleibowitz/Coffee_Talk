class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    if @request.confirmed
      @meeting = Meeting.find(@request.meeting_id)
    end
  end

  def new
    @request = Request.new
    @tomorrow = Date.current+1
    @day_after_tomorrow = Date.current+2
    @day_after_day_after_tomorrow = Date.current+3
  end

  def create
    @user = current_user
    @request = Request.new(request_params)
    @request.confirmed = false
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @request = Request.find(params[:id])
    @user = @request.user
    @request.destroy
    redirect_to @user
  end




  private
  def request_params
    return params.require(:request).permit(:user_id, :confirmed, :date, :time)
  end

end
