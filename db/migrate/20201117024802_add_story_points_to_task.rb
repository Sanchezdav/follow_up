class AddStoryPointsToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :story_points, :integer
  end
end
