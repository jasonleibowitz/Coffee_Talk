class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting

  def ago
    diff = Time.diff(Time.now, self.created_at)
    @ago = ""
    if diff[:day] == 1
      @ago << "#{diff[:day]} day, "
    elsif diff[:day] > 1
      @ago << "#{diff[:day]} days, "
    end
    if diff[:hour] == 1
      @ago << "#{diff[:hour]} hour, "
    elsif diff[:hour] > 1
      @ago << "#{diff[:hour]} hours, "
    end
    if diff[:minute] == 1
      @ago << "#{diff[:minute]} minute, "
    elsif diff[:minute] > 1
      @ago << "#{diff[:minute]} minutes, "
    end
    if diff[:second] == 1
      @ago << "#{diff[:second]} second ago"
    elsif diff[:second] > 1
      @ago << "#{diff[:second]} seconds ago"
    end
    return @ago
  end

  def recommendation
    # array of all users who made requests
    @users = Request.where(confirmed: false)
    current_user = self.user


    jaccard = @users.map! do |this_request|

      # We can define jaccard_index getter in runtime as singleton...
        this_request.define_singleton_method(:jaccard_index) do
          @jaccard_index
        end

        # also setter
        this_request.define_singleton_method("jaccard_index=") do |index|
          @jaccard_index = index || 0.0
        end
        # Calculate the intersection between sets
        intersection = current_user.interests & this_request.user.interests
        union = current_user.interests | this_request.user.interests

      # Assign the division and rescue if division is not possible with 0
      if this_request.user != current_user
        this_request.jaccard_index = ( intersection.size.to_f ) / ( union.size.to_f ) rescue 0.0

        this_request
      end

    end

    # Removes the nil returned from current user
    jaccard.delete_if { |item| item == nil }

    # Removes all requests at different dates from the user's request
    jaccard.delete_if { |item| item.date != self.date }

    # Removes all requests at different times from the user's requet
    jaccard.delete_if { |item| item.time != self.time }

    # Removes all users further than 10 miles from current user
    jaccard.delete_if { |item| item.user.haversine(current_user.zipcode.to_lat.to_f, current_user.zipcode.to_lon.to_f, item.user.zipcode.to_lat.to_f, item.user.zipcode.to_lon.to_f) > 10 }

    # Removes all users more than 10 years differen than current user
    jaccard.delete_if { |item| ( item.user.age - current_user.age ).abs > 10 }

    # Removes all users with a Jaccard Index of 0, i.e. no similarities
    jaccard.delete_if { |item| item.jaccard_index <= 0 }

    # Removes all users current user previously met with
    previous_users_met_with = current_user.meetings.map do |previous_user_meetings|
      previous_user_meetings.users
    end
    previous_users_met_with = previous_users_met_with.flatten.uniq
    jaccard.delete_if { |item| previous_users_met_with.include? item.user }

    return jaccard.sort_by { |item| 1 - item.jaccard_index}
  end

  def location_recommendation(user)
    coffeeshop_recommendation = Foursquare.top_coffeehouses_name(user, 1)
    return coffeeshop_recommendation
  end

  def schedule_meetups
    # @requests = Request.where(confirmed: false)
  # @requests.each do |request|
      if self.recommendation.count < 2
        # no meetups available
      else
        # schedule meetup
        recommended_user_requests = self.recommendation
        meetup = Meeting.create(date: self.date, time: self.time)
        self.update(meeting_id: meetup.id)
        recommended_user_requests.first.update(meeting_id: meetup.id)
        self.update(confirmed: true)
        recommended_user_requests.first.update(confirmed: true)

        recommended_user_requests[1].update(meeting_id: meetup.id)
        recommended_user_requests[1].update(confirmed: true)

        coffeeshop_recommendation = self.location_recommendation(self.user)

        meetup.update(location: coffeeshop_recommendation.first)
      end
  end



end
