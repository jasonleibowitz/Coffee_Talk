require_relative '../spec_helper.rb'

describe User do
  before :each do
    @jason = User.new(first_name: "Jason", last_name: "Leibowitz", email: "leibo@gmail.com", dob: "1987-02-26", zipcode: "11201", admin: true, profile_pic: 'http://i.imgur.com/5z5NbX5.jpg', password: "hijesse", password_confirmation: "hijesse")
    @jason.save

    @steph = User.new(first_name: "Stephanie", last_name: "Eagle", email: "stepheagle@gmail.com", dob: "1990-09-01", zipcode: "10009", admin: false, profile_pic: "https://scontent-a-lga.xx.fbcdn.net/hphotos-ash2/t1.0-9/400523_4892829593917_1295297482_n.jpg", password: "password", password_confirmation: "password")
    @steph.save

    @interest_array = ["Premier League Soccer", "American Politics", "Israel"]
  end

  describe "#age" do
    it "gives the age from a birthdate" do
      expect(@jason.age).to eq 27
    end
  end

  describe "#latlon" do
    it "converts the user's zipcode to latitude and longetude coordinate" do
      expect(@jason.latlon.join(",")).to eq "40.695286,-73.98907"
    end
  end

  describe "#haversine" do
    it "take two users and return the distance in miles between them" do
      expect(@jason.haversine(@jason.zipcode.to_lat.to_f, @jason.zipcode.to_lon.to_f, @steph.zipcode.to_lat.to_f, @steph.zipcode.to_lon.to_f)).to eq 2.264662447047386
    end
  end



end
