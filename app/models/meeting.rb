class Meeting < ActiveRecord::Base
  # belongs_to :location
  # has_and_belongs_to_many :users
  has_many :requests
  has_many :users, through: :requests

  serialize :location



end
