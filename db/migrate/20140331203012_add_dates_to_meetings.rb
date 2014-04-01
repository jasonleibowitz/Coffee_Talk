class AddDatesToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :created_at, :datetime
    add_column :meetings, :updated_at, :datetime
  end
end
