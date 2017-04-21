class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :weight
      t.integer :tired
      t.integer :sleep
      t.text :nausea
      t.text :other

      t.timestamps
    end
  end
end
