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


end
