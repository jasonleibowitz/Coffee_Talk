class AddLocationInfoToMeetings < ActiveRecord::Migration
  def change
    change_column :meetings, :location_id, :text
  end
end
