class Feedback < ApplicationRecord
  has_paper_trail
  validates :name, :phone_number, presence: true
  validates :message, presence: true, length: { minimum: 3}
  validates :phone_number, presence: true, phone: { possible: false, allow_blank: false, types: [:mobile] }
  validates :email, presence: true, case_sensitive: false, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
