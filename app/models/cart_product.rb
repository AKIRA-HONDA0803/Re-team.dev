class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :member, optional: true
end
