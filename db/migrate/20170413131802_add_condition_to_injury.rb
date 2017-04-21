class AddConditionToInjury < ActiveRecord::Migration[5.0]
  def change
    add_column :injuries, :heal, :boolean
  end
end
