class AddReviewToChecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :checklists, :review, :float
  end
end
