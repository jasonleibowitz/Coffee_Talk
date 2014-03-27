class CreateMeetingsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :meetings, :users
  end
end
