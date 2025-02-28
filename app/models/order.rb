class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_one :invoice

  validates :total_amount, presence: true
end
