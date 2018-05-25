class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :price, :description, presence: true
  has_paper_trail
end
