class AddDatetimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :datetime, :datetime
  end
end
