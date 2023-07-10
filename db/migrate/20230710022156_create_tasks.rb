class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :started
      t.boolean :finished
      t.boolean :edited
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
