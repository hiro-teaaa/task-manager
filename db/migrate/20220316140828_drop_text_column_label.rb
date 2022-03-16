class DropTextColumnLabel < ActiveRecord::Migration[7.0]
  def up
    remove_column :labels, :text
  end

  # 変更前の状態
  def down
    add_column :labels, :text, :string
  end
end
