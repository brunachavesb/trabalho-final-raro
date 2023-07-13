class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nome, null: false, limit: 255
      t.string :email, null: false, limit: 255
      t.index [:email], unique: true

      t.timestamps
    end
  end
end
