class MasterBrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :initial, :description, :is_active, :created_by, :updated_by, :created_at, :updated_at
end
