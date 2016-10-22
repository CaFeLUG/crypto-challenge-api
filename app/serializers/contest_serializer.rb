class ContestSerializer < ActiveModel::Serializer
  attributes :id, :name, :begins_at, :ends_at, :status, :rules
end
