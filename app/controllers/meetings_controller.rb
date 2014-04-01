class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show

  end

  def new
    @meeting = Meeting.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
