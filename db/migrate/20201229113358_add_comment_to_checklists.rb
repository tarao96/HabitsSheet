class AddCommentToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :comment, :text
  end
end
