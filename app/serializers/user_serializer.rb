class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :username, :avatar
end
