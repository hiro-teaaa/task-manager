class ChangeNilVaildToTask < ActiveRecord::Migration[7.0]
  def up
    change_column :tasks, :priority, :integer, default: 1
    change_column :tasks, :task_name, :text, null: false
  end

  # 変更前の状態
  def down
    change_column :tasks, :priority, :integer, default: 0
    change_column :tasks, :task_name, :text, null: true
  end
end
