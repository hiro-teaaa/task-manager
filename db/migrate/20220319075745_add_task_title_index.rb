class AddTaskTitleIndex < ActiveRecord::Migration[7.0]
def up
  change_column :tasks, :task_name, :string
  add_index :tasks, :status
end
def down
  change_column :tasks, :task_name, :text
  remove_index :tasks, :status
end
end
