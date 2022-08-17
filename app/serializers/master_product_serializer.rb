class MasterProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_code, :description, :is_active, :price, :image, :expired_date, :created_by, :updated_by, :created_at, :updated_at, :master_location

  belongs_to :master_brand, class_name: "master_brand", foreign_key: "master_brand_id"
  belongs_to :master_unit, class_name: "master_unit", foreign_key: "primary_unit"
  # belongs_to :master_location, class_name: "master_location", foreign_key: "location_ids"

  def master_location
    @location_ids = object.location_ids.split(",").map(&:strip)
    @master_location = MasterLocation.find(@location_ids)
    return @master_location
  end

end
