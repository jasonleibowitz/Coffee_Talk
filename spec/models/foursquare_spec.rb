require_relative '../spec_helper.rb'

describe Foursquare do
  before :each do
    @jason = User.new(first_name: "Jason", last_name: "Leibowitz", email: "leibo@gmail.com", dob: "1987-02-26", zipcode: "11201", admin: true, profile_pic: 'http://i.imgur.com/5z5NbX5.jpg', password: "hijesse", password_confirmation: "hijesse", about: "meh")
    @jason.save
  end

  describe ".top_coffeehouses_name" do
    it "returns the names for the specified number of coffeeshops near user" do
      expect(Foursquare.top_coffeehouses_name(@jason, 1).first["name"]).to eq "Vineapple Cafe"
    end
  end

  describe ".coffeeshop_venue" do
    it "returns more information about a specific coffeeshop via foursquare venue id" do
      expect(Foursquare.coffeeshop_venue('4de26e06814df7ebdc14af8b')["name"]).to eq "Vineapple Cafe"
    end
  end

  describe ".google_map" do
    it "returns a google map based on a coffeeshop's lat and lon" do
      lat = Foursquare.coffeeshop_venue('4de26e06814df7ebdc14af8b')["location"]["lat"]
      lon = Foursquare.coffeeshop_venue('4de26e06814df7ebdc14af8b')["location"]["lng"]
      expect(Foursquare.google_map(lat, lon)).to eql("http://maps.googleapis.com/maps/api/staticmap?center=40.69834998317835,-73.99289409776352&zoom=17&size=400x400&markers=color:red%7C40.69834998317835,-73.99289409776352&sensor=false")
    end
  end

  describe ".foursquare_search" do
    it "returns information about coffeeshops near a user" do
      expect(Foursquare.foursquare_search(@jason)).to have_at_least(4).items
    end
  end


end
