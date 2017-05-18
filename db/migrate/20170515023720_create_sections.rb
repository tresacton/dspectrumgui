class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :device_id
      t.string :name
      t.string :notes
      t.integer :start_pos
      t.integer :end_pos
      t.string :colour

      t.timestamps null: false
    end
  end
end
