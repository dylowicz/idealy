class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content, null: false
      t.column :type, :integer, default: 0, null: false
      t.references :idea, index: true, foreign_key: true

      t.timestamps
    end
  end
end
