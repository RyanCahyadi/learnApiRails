class MasterProduct < ApplicationRecord
    belongs_to :master_brand, class_name: 'MasterBrand', foreign_key: 'ms_brand_id'
    belongs_to :master_unit, class_name: 'MasterUnit', foreign_key: 'primary_unit'
end
