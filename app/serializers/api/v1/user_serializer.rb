class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :username, :avatar
end
