class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :fcc_id
      t.string :baudrate
      t.float :frequency
      t.string :modulation
      t.string :encoding
      t.string :name
      t.text :notes

      t.timestamps null: false
    end
  end
end
