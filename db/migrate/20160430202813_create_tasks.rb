class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :completed, default: false, null: false
      t.references :idea, index: true, foreign_key: true

      t.timestamps
    end
  end
end
