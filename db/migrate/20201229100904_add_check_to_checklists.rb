class AddCheckToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :check, :boolean
  end
end
