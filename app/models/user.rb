class User < ActiveRecord::Base
  has_and_belongs_to_many(:interests)
  has_and_belongs_to_many(:meetings)

  has_secure_password

  validates :first_name, :last_name, :email, :dob, :zipcode, :password, presence: true
  validates :password, confirmation: true
  validates :zipcode, length: { is: 5 }, numericality: true
  validates :email, uniqueness: true

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - (self.dob.to_date.change(:year => now.year) > now ? 1 : 0)
  end

end
