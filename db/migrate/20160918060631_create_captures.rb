class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.integer :unit_id
      t.integer :device_id
      t.string :name
      t.text :notes
      t.text :binary
      t.text :original_binary

      t.timestamps null: false
    end
  end
end
