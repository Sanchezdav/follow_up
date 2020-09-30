class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.integer :position
      t.string :slug, unique: true, index: true

      t.timestamps
    end
  end
end
