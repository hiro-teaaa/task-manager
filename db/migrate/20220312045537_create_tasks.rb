class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.datetime :data_limit
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
