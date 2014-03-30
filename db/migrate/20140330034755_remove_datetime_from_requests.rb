class RemoveDatetimeFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :datetime
  end
end
