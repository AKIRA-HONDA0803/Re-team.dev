class Product < ApplicationRecord
  belongs_to :genre
  belongs_to :order_product
  belongs_to :cart_product
  attachment :image
end
