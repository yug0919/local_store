class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :order, optional: true

  validates :amount_paid, presence: true
end
