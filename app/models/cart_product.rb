class CartProduct < ApplicationRecord
  has_many :product, dependent: :destroy
  belongs_to :member
end
