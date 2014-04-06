class LocationsController < ApplicationController

  def view
    info = Location.shop_info(params[:shop_id])
    @venue = info[0]
    @photo_url = info[1]
    @tips = info[2]
    @google_map = info[3]
  end

end
