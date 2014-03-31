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
    @users = Request.where(confirmed: false).map { |request| request.user }
    current_user = self.user


    jaccard = @users.map! do |this_user|

      # We can define jaccard_index getter in runtime as singleton...
        this_user.define_singleton_method(:jaccard_index) do
          @jaccard_index
        end

        # also setter
        this_user.define_singleton_method("jaccard_index=") do |index|
          @jaccard_index = index || 0.0
        end
        # Calculate the intersection between sets
        intersection = current_user.interests & this_user.interests
        union = current_user.interests | this_user.interests

      # Assign the division and rescue if division is not possible with 0
      if this_user != current_user
        this_user.jaccard_index = ( intersection.size.to_f ) / ( union.size.to_f ) rescue 0.0

        this_user
      end

    end

    # Removes the nil returned from current user
    jaccard.delete_if { |item| item == nil }
binding.pry
    # Removes all requests at different times from the user's request

    # Removes all users further than 10 miles from current user
    jaccard.delete_if { |item| item.haversine(current_user.zipcode.to_lat.to_f, current_user.zipcode.to_lon.to_f, item.zipcode.to_lat.to_f, item.zipcode.to_lon.to_f) > 10 }

    # Removes all users more than 10 years differen than current user
    jaccard.delete_if { |item| ( item.age - current_user.age ).abs > 10 }
    return jaccard.sort_by { |item| 1 - item.jaccard_index}
  end



end
