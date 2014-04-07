class RequestMailer < ActionMailer::Base
  default from: "richmanlikebuttah@gmail.com"

  def meeting_scheduled_email(request)
    @user = request.user
    @date = r.meeting.date
    @time = r.meeting.time

    if r.meeting.users[0] == @user
      @person1 = r.meeting.users[1]
      @person2 = r.meeting.users[2]
    elsif r.meeting.users[1] == @user
      @person1 = r.meeting.users[0]
      @person2 = r.meeting.users[2]
    elsif r.meeting.users[2] == @user
      @person1 = r.meeting.users[0]
      @person2 = r.meeting.users[1]
    end

  end

end
