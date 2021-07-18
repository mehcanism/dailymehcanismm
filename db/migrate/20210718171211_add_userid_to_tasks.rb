class AddUseridToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :userid, :integer
  end
end
