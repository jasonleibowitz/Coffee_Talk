class AddDateAndTimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :date, :date
    add_column :requests, :time, :time
  end
end
