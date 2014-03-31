class Meeting < ActiveRecord::Base
  belongs_to :locations
  # has_and_belongs_to_many :users
  has_many :requests
  has_many :users, through: :requests



end
