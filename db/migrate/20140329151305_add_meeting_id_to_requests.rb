class AddMeetingIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :meeting_id, :integer
    add_index :requests, :meeting_id
  end
end
