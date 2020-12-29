class AddReasonToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :reason, :text
  end
end
