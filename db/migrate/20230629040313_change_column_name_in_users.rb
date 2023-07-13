class ChangeColumnNameInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :nome, :name
  end
end