class RemoveDateTimeFromMeetings < ActiveRecord::Migration
  def change
    remove_column :meetings, :datetime
  end
end
