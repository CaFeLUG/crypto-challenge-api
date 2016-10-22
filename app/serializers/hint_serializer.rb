class HintSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :challenge
end
