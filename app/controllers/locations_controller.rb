class LocationsController < ApplicationController

  def view
    location = params[:shop_id]
    @venue = Foursquare.coffeeshop_venue(location)
    @photo_url = "#{@venue["photos"]["groups"].first["items"].first["prefix"]}original#{@venue["photos"]["groups"].first["items"].first["suffix"]}"
    @tips = @venue["tips"]["groups"].first["items"]
    @google_map = Foursquare.google_map(@venue["location"]["lat"], @venue["location"]["lng"])
  end

end
