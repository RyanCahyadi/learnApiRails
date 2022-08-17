class MasterUnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_active, :created_by, :updated_by, :created_at, :updated_at
end
