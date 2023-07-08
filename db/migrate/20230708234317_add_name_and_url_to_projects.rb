class AddNameAndUrlToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :name, :string, null: false
    add_column :projects, :url, :string, null: false
  end
end
