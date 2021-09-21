class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :member
  belongs_to :order
end
