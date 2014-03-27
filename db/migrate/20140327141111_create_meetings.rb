class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :datetime
      t.integer :location_id
    end
  end
end
