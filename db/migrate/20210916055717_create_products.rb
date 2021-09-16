class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.boolean :product_status, default: true, null: false
      t.string :image_id
      t.integer :price
      
      t.timestamps
    end
  end
end
