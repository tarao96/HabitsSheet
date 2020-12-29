class AddRateToChecklist < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :rate, :float
  end
end
