class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :master_products, :master_brands, column: :ms_brand_id, primary_key: :id
    add_foreign_key :master_products, :master_units, column: :primary_unit, primary_key: :id
  end
end
