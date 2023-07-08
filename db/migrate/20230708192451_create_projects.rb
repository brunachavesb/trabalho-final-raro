class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :id_project, null: false
      t.string :id_user, null: false

      t.timestamps
    end
  end
end
