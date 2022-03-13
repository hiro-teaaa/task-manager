class AddNilFalseToTaskTitile < ActiveRecord::Migration[7.0]
  def up
    change_column :tasks, :status, :integer, default: 0
    change_column :tasks, :task_name, :text, null: false
    rename_column :tasks, :data_limit, :date_limit
  end

  # 変更前の状態
  def down
    change_column :tasks, :status, :integer
    change_column :tasks, :task_name, :text, null: true
    rename_column :tasks, :data_limit, :data_limit
  end
end
