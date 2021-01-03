class RemoveDateToChecklists < ActiveRecord::Migration[5.1]
  def change
    remove_column :checklists, :date, :integer
  end
end
