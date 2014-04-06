require 'pry'
require_relative '../spec_helper.rb'

describe Request do
  before :each do
    @football = Interest.new(name: "Football", description: "The greatest game")
    @football.save
    @politics = Interest.new(name: "Politics", description: "meh")
    @politics.save
    @jason = User.new(first_name: "Jason", last_name: "Leibowitz", email: "leibo@gmail.com", dob: "1987-02-26", zipcode: "11201", admin: true, profile_pic: 'http://i.imgur.com/5z5NbX5.jpg', password: "hijesse", password_confirmation: "hijesse", about: "about")
    @jason.save
    @josh = User.new(first_name: "Josh", last_name: "Leibowitz", email: 'joshileibowitz@gmail.com', dob: "1990-12-28", zipcode: '10010', admin: false, profile_pic: 'http://i.imgur.com/6IWIhIE.jpg', password: 'password', password_confirmation: 'password', about: "about")
    @josh.save
    @bill = User.new(first_name: "Bill", last_name: "Murray", email: "billmurray@gmail.com", dob: '1981-07-21', zipcode: '10004', admin: false, profile_pic: 'http://i.imgur.com/J5dDWh2.png', password: 'password', password_confirmation: 'password', about: "about")
    @bill.save
    @request = Request.new(user_id: @jason.id, confirmed: false, date: '2014-04-05', time: '16')
    @request.save
    @request2 = Request.new(user_id: @josh.id, confirmed: false, date: '2014-04-05', time: '16')
    @request2.save
    @request3 = Request.new(user_id: @bill.id, confirmed: false, date: '2014-04-05', time: '16')
    @request3.save
    @jason.interests << @football
    @jason.interests << @politics
    @josh.interests << @football
    @josh.interests << @politics
    @bill.interests << @football
    @bill.interests << @politics
  end

  describe "#location_recommendation(jason)" do
    it "finds the best rated coffeeshop near a user" do
      expect(@request.location_recommendation(@jason).first["name"]).to eq "Vineapple Cafe"
    end
  end

  describe '#recommendation' do
    it "compares all unconfirmed requests and returns an array of similar users who can meet with owner of request" do
      expect(@request.recommendation).to eq [@request2, @request3]
    end
  end

  describe "#schedule_meetups" do
    it "creates meetings from all matched requests so that all meetings have 3 people" do
      @request.schedule_meetups
      expect(@request.confirmed).to eql true
      expect(@request.meeting_id).not_to be_nil
      expect(@request.date).not_to be_nil
    end
  end

  describe "#ago" do
    it "returns the difference between the request start date and now in a string" do
      expect(@request.ago).to eql "0 seconds ago"
    end

  end

end
