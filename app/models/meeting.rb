class Meeting < ActiveRecord::Base
  has_many(:interests)
  has_and_belongs_to_many(:users)
end
