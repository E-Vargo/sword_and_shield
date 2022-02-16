class CreateShields < ActiveRecord::Migration
  def change
    create_table :shields do |t|
      t.text :name
      t.integer :value
      t.text :defensiveness

      t.timestamps null: false
    end
  end
end
