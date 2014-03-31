class Meeting < ActiveRecord::Base
  belongs_to :locations
  has_and_belongs_to_many :users
  has_many :requests

  # def schedule_meetups
  #   @requests = Request.where(confirmed: false)
  #   @requests.each do |request|
  #     if request.recommendation.count < 2
  #       # no meetups available
  #     else
  #       # schedule meetup
  #       users = request.recommendation
  #       meetup = Meeting.new(date: request.date, time: request.time)
  #       request.meeting_id = meetup.id
  #       users.each do |meetup_user|
  #         meetup_user.request.meeting_id = meetup.id
  #         meetup_user.request.confirmed = true
  #       end
  #       request.confirmed = true
  #     end
  #   end
  # end

end
