class RequestMailer < ActionMailer::Base
  default from: "richmanlikebuttah@gmail.com"

  def meeting_scheduled_email(request)
    @user = request.user
    @date = request.meeting.date
    @time = request.meeting.time

    if request.meeting.users[0] == @user
      @person1 = request.meeting.users[1]
      @person2 = request.meeting.users[2]
    elsif request.meeting.users[1] == @user
      @person1 = request.meeting.users[0]
      @person2 = request.meeting.users[2]
    elsif request.meeting.users[2] == @user
      @person1 = request.meeting.users[0]
      @person2 = request.meeting.users[1]
    end

  end

end
