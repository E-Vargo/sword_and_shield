class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
