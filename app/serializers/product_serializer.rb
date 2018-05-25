class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image

  def price
    ActiveSupport::NumberHelper.number_to_currency(object.price, precision: 0, unit: "")
  end
end
