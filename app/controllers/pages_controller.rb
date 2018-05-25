class PagesController < ApplicationController
  def landing
    @product_images = Product.order(created_at: :desc).map(&:image_url)
  end

  def contact
    @feedback = Feedback.new
  end
end
