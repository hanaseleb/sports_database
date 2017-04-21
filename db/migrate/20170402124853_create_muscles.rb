class CreateMuscles < ActiveRecord::Migration[5.0]
  def change
    create_table :muscles do |t|
      t.integer :benchpress
      t.integer :squat
      t.integer :chin_up
      t.integer :deadlift

      t.timestamps
    end
  end
end
