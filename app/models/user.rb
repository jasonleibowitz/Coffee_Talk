class User < ActiveRecord::Base
  has_and_belongs_to_many :interests
  # has_and_belongs_to_many :meetings
  has_many :requests
  has_many :meetings, through: :requests

  has_secure_password

  validates :first_name, :last_name, :email, :dob, :zipcode, :profile_pic, :about, presence: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :zipcode, length: { is: 5 }
  validates :email, uniqueness: true

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - (self.dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def latlon
    lat = self.zipcode.to_lat.to_f
    lon = self.zipcode.to_lon.to_f
    return lat.to_f, lon.to_f
  end

  def update_interests(params)

    array = []
    updated_prefs = params

    # Remove all interests from user
    self.interests.destroy_all

    # Add all interests from params into an array
    updated_prefs.each do |k,v|
      Interest.all.each do |interest|
        if k == interest.name
          array << k
        end
      end
    end

    # Update user's interests with all chosen interests
    array.each do |selected_interest|
      self.interests << Interest.find_by(name: selected_interest)
    end
  end

  def haversine(lat1, long1, lat2, long2)
    dtor = Math::PI/180
    r = 3959

    rlat1 = lat1 * dtor
    rlong1 = long1 * dtor
    rlat2 = lat2 * dtor
    rlong2 = long2 * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
  end


  private
  def power(num, pow)
    num ** pow
  end

end
