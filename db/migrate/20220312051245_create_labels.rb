class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :label_name
      t.string :text

      t.timestamps
    end
  end
end
