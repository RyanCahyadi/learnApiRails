class CreateMasterProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :master_products do |t|
      t.string :name
      t.string :item_code
      t.string :description
      t.boolean :is_active
      t.integer :ms_brand_id
      t.integer :primary_unit
      t.string :location_ids
      t.float :price
      t.string :image
      t.date  :expired_date
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
    add_index :master_products, :ms_brand_id
    add_index :master_products, :primary_unit
    add_index :master_products, :location_ids
  end
end
