class RequestsController < ApplicationController

  def index
    @requests = Requests.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @tomorrow = Date.current+1
    @day_after_tomorrow = Date.current+2
    @day_after_day_after_tomorrow = Date.current+3
  end

  def create
    # @user = current_user
    # @request = Request.new(request_params)
    # @request.confirmed = false
    # if @request.valid?
    #   @request.save
    #   redirect_to @user
    # else
    #   render 'new'
    # end
    render text: params.inspect
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def request_params
    return params.require(:request).permit(:user_id, :confirmed, :date, :time)
  end

end
