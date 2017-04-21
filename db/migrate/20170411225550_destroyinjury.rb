class Destroyinjury < ActiveRecord::Migration[5.0]
  def change
    drop_table :injuries
  end
end
