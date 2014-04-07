class RequestMailer < ActionMailer::Base
  default from: "richmanlikebuttah@gmail.com"

  def meeting_scheduled_email(request)
    @user = request.user
    @date = request.meeting.date
    @time = request.meeting.time
    @url = 'http://coffeetalk.herokuapp.com'

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
    @location_name = request.meeting.location["name"]
    @location_address = request.meeting.location["location"]["address"]
    @location_id = request.meeting.location["id"]
    mail(to:@user.email, subject: "Your Coffee Talk Meetup Has Been Confirmed")

  end

end
