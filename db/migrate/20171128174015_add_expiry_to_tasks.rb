class AddExpiryToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :expiry, :datetime, default: Time.current
  end
end
