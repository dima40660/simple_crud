class AddImportanceToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :importance, :integer, :default => 0
  end
end
