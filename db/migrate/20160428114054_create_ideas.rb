class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title, null: false
      t.text :description
      t.column :status, :integer, default: 0, null: false
      t.integer :score, default: 0, null: false

      t.timestamps
    end
  end
end
