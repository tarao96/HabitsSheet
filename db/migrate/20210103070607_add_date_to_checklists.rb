class AddDateToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :date, :string
  end
end
