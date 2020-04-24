class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :position
      t.datetime :deadline
      t.datetime :done
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
