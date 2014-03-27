class Location < ActiveRecord::Base
  belongs_to(:meeting)
end
