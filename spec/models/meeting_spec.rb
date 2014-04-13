require_relative '../spec_helper.rb'

describe Meeting do

  it { should have_many :requests }
  it { should have_many(:users).through(:requests) }

end
