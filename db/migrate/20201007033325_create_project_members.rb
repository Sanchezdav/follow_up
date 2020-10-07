class CreateProjectMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_members do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
