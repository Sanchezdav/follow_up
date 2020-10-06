class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :label, null: false, foreign_key: true
      t.string :title, null: false, default: ''
      t.integer :position
      t.string :slug, unique: true, index: true

      t.timestamps
    end
  end
end
