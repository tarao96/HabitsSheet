class RemoveReviewToChecklists < ActiveRecord::Migration[5.1]
  def change
    remove_column :checklists, :review, :text
  end
end
