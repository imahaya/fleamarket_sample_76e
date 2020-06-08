class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.text :introduction,null:false
      t.string :consignor_area, null:false
      t.integer :price, null:false
      t.integer :days, null:false
      t.integer :delivery_fee, null:false
      t.integer :condition, null:false
      t.string :size, null:false
      # t.references :category_id, null:false,foreign_key:true
      # t.references :user_id, null:false,foreign_key:true
      # t.references :image_id, null:false,foreign_key:true
      # t.references :brand_id, null:false,foreign_key:true
      t.timestamps
    end
  end
end