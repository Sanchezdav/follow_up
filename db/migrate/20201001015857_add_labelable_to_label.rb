class AddLabelableToLabel < ActiveRecord::Migration[6.0]
  def change
    remove_column :labels, :project_id
    add_reference :labels, :labelable, polymorphic: true, index: true
  end
end
