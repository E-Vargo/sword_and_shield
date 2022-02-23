class CreateShields < ActiveRecord::Migration[4.2]
  def change
    create_table :shields do |t|
      t.text :name
      t.integer :value
      t.text :defensiveness
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
