class AddAsigneeAndReporterToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :reporter_id, :integer, null: true, foreign_key: true
    add_column :tasks, :assignee_id, :integer, null: true, foreign_key: true

    add_index :tasks, :reporter_id
    add_index :tasks, :assignee_id
  end
end
