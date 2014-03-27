class InterestsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :interests, :users
  end
end
