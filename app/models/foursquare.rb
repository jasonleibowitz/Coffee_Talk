class Foursquare < ActiveRecord::Base

  @@foursquare_url = 'https://api.foursquare.com/v2/venues/explore?client_id=QAOJQNY2JJHJC2DNYHLDH0EEBPFDZAXEOA44DY1X1BZJOJOD&client_secret=4IBKRTTJCKADRNBP3GMLCOYJUF3N21G2HX1VEIE0C4E5D5PX&v='

  @@foursquare_venue1 = 'https://api.foursquare.com/v2/venues/'
  @@foursquare_venue2 = '?client_id=QAOJQNY2JJHJC2DNYHLDH0EEBPFDZAXEOA44DY1X1BZJOJOD&client_secret=4IBKRTTJCKADRNBP3GMLCOYJUF3N21G2HX1VEIE0C4E5D5PX&v=20140331'

  @@google_maps = 'http://maps.googleapis.com/maps/api/staticmap?center='

  @@blacklist = ['starbucks']

  def self.foursquare_search(user)
    foursquare_path = "#{@@foursquare_url}#{Date.current.year}#{Date.current.month}#{Date.current.day}&ll=#{user.latlon.join(",")}&query=coffee"
    response = HTTParty.get(foursquare_path)
    return response["response"]["groups"].first["items"]
  end

  def self.top_coffeehouses_name(user, num)
    @counter = 0
    @coffeehouses_array = []
    @coffeehouses = foursquare_search(user)
    while @coffeehouses_array.count < num
      coffeehouse = @coffeehouses[@counter]["venue"]
      unless @@blacklist.include? coffeehouse["name"].downcase
        @coffeehouses_array << coffeehouse
      end
      @counter += 1
    end
    return @coffeehouses_array
  end

  def self.coffeeshop_venue(venue_id)
    response = HTTParty.get("#{@@foursquare_venue1}#{venue_id}#{@@foursquare_venue2}")
    venue = response["response"]["venue"]
    return venue
  end

  def self.google_map(lat, lon)
    @map_url = "#{@@google_maps}#{lat},#{lon}&zoom=17&size=400x400&markers=color:red%7C#{lat},#{lon}&sensor=false"
    return @map_url
  end

end
