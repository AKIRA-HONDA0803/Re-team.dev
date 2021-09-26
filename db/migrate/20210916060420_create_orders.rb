class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :shipping_fee
      t.integer :bill
      t.integer :order_status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :payment_method
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
