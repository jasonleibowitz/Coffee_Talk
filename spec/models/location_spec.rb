require_relative '../spec_helper.rb'

describe Location do
  describe ".shop_info" do
    it "returns an array of information about a coffeeshop" do
      shop_id = '4de26e06814df7ebdc14af8b'
      expect(Location.shop_info(shop_id)[1]).to eql("https://irs3.4sqi.net/img/general/original/28190869_UmbMW9cjX_YEZlOLWjBkdx7BpeScdlvOKw8Dg_LLrk4.jpg")
      expect(Location.shop_info(shop_id)[3]).to eql("http://maps.googleapis.com/maps/api/staticmap?center=40.69834998317835,-73.99289409776352&zoom=17&size=400x400&markers=color:red%7C40.69834998317835,-73.99289409776352&sensor=false")
    end
  end
end
