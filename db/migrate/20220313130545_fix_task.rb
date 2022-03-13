class FixTask < ActiveRecord::Migration[7.0]
  def up
    change_column :tasks, :task_name, :string
  end
  def down
    change_column :tasks, :task_name, :text
  end
end
