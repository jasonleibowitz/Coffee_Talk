class AddCreatedatToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :created_at, :datetime
    add_column :requests, :updated_at, :datetime
  end
end
