class ChangeLocationnameOnMeetings < ActiveRecord::Migration
  def change
    rename_column :meetings, :location_id, :location
  end
end
