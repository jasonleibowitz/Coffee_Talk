class User < ActiveRecord::Base
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :meetings
  has_many :requests

  has_secure_password

  validates :first_name, :last_name, :email, :dob, :zipcode, :profile_pic, presence: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :zipcode, length: { is: 5 }, numericality: true
  validates :email, uniqueness: true

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - (self.dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def update_interests(array)
    # if a selected interest is not in the user's interest list, add it
    array.each do |selected_interest|
      if !self.interests.include?(Interest.find_by(name: selected_interest))
        self.interests << Interest.find_by(name: selected_interest)
      end
    end

    # if an interest is not in the array, but is in the user.interests.include? then remove it
    Interest.all.each do |db_interest|
      if !array.include?(db_interest.name) && self.interests.include?(db_interest)
        self.interests.destroy(db_interest)
      end
    end
  end

end
