class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.integer :date
      t.string :try
      t.float :review
      
      t.timestamps
    end
  end
end
