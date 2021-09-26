class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_producs, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  attachment :image

  validates :name, {presence: true}
  validates :description, {presence: true}
  validates :price, {presence: true}
end
