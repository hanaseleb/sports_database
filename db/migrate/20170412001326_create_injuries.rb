class CreateInjuries < ActiveRecord::Migration[5.0]
  def change
    create_table :injuries do |t|
      t.string :part
      t.integer :user_id

      t.timestamps
    end
  end
end
