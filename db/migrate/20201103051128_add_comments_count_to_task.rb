class AddCommentsCountToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :comments_count, :integer, default: 0
  end
end
