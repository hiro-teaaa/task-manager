class AddTaskNameIndex < ActiveRecord::Migration[7.0]
  def up
    add_index :tasks, :task_name
  end
  def down
    remove_index :tasks, :task_name
  end

end
