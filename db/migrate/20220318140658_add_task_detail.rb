class AddTaskDetail < ActiveRecord::Migration[7.0]
  def up
    add_column :tasks, :detail, :text
  end

  # 完全に忘れていた………
  def down
    remove_column :tasks, :detail
  end
end
