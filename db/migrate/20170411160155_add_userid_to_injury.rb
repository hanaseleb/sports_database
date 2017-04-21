class AddUseridToInjury < ActiveRecord::Migration[5.0]
  def change
    add_column :injuries, :user_id, :string
  end
end
