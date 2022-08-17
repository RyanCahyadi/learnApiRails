class MasterProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_code, :description, :is_active, :ms_brand_id, :primary_unit, :location_ids, :price, :image, :expired_date, :created_by, :updated_by, :created_at, :updated_at

  belongs_to :master_brand, class_name: "master_brand", foreign_key: "master_brand_id"
  belongs_to :master_unit, class_name: "master_unit", foreign_key: "primary_unit"
end
