class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :device_id
      t.string :name
      t.text :notes

      t.timestamps null: false
    end
  end
end
