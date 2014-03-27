class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :location
      t.datetime :datetime
    end
  end
end
