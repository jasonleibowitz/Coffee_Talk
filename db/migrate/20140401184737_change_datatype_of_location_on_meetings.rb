class ChangeDatatypeOfLocationOnMeetings < ActiveRecord::Migration
  def change
    change_column :meetings, :location_id, :string
  end
end
