class Address < ApplicationRecord
  belongs_to :member, optional: true
  def address_all
   "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
