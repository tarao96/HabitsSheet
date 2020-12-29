class RemoveRateToChecklists < ActiveRecord::Migration[5.1]
  def change
    remove_column :checklists, :rate, :float
  end
end
