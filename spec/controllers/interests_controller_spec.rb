require_relative '../spec_helper.rb'

  describe InterestsController do
    before :each do
      @jason = User.create(first_name: "Jason", last_name: "Leibowitz", email: 'jasonaleibowitz@gmail.com', dob: '1987-02-26', zipcode: '11201', admin: true, password: 'password', password_confirmation: 'password', about: 'meh', profile_pic: 'tbd')
    end

    # describe "POST save_prefs" do
    #   it "updates a user's interests" do
    #     current_user = @jason
    #     params = {"utf8"=>"✓", "authenticity_token"=>"ARz5l32SBtc8RJqtzAKLSS9B64Ct5t+JcYja/aJhIjs=", "Premier League Soccer"=>"1", "American Politics"=>"1", "StartUp"=>"1", "Israel"=>"1", "commit"=>"Save changes", "action"=>"save_prefs", "controller"=>"interests"}
    #     post :save_prefs
    #     expect(current_user.interests).to have 3.things
    #   end
    # end

end

