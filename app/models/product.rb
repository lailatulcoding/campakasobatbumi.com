class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :price, :description, presence: true
end
