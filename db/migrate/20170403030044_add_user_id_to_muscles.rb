class AddUserIdToMuscles < ActiveRecord::Migration[5.0]
  def change
    add_column :muscles, :user_id, :integer
  end
end
