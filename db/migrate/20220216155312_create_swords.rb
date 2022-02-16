class CreateSwords < ActiveRecord::Migration[4.2]
  def change
    create_table :swords do |t|
      t.text :name
      t.integer :value
      t.text :lethality

      t.timestamps null: false
    end
  end
end
