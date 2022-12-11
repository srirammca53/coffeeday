class Order < ApplicationRecord
  has_many :products
  validates :customer_name, presence: true,length: { minimum: 5 }
  validates :mobile, presence: true, numericality: true, length: {minimum: 10, maximum: 10}
end
