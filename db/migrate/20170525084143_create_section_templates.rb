class CreateSectionTemplates < ActiveRecord::Migration
  def change
    create_table :section_templates do |t|
      t.string :name
      t.text :sections
      t.string :added_by

      t.timestamps null: false
    end
  end
end
