class AddUserIdAndTaskId < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :user_id, :integer
    add_column :checklists, :task_id, :integer
  end
end
