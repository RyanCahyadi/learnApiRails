class CreateMasterLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :master_locations do |t|
      t.string :name
      t.boolean :is_active
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
