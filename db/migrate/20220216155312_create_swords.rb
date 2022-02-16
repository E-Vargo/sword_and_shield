class CreateSwords < ActiveRecord::Migration
  def change
    create_table :swords do |t|
      t.text :name
      t.integer :value
      t.text :lethality

      t.timestamps null: false
    end
  end
end
