class CreateMasterBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :master_brands do |t|
      t.string :name
      t.string :description
      t.boolean :is_active
      t.string :initial
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
