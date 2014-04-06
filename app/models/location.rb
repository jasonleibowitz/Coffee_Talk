class Location < ActiveRecord::Base
  has_many :meetings

  def self.shop_info(shop_id)
    venue = Foursquare.coffeeshop_venue(shop_id)

    photo_url = "#{venue["photos"]["groups"].first["items"].first["prefix"]}original#{venue["photos"]["groups"].first["items"].first["suffix"]}"

    tips = venue["tips"]["groups"].first["items"]

    google_map = Foursquare.google_map(venue["location"]["lat"], venue["location"]["lng"])

    return [venue, photo_url, tips, google_map]
  end

end
