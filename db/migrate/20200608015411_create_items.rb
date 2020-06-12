class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.text :introduction,null:false
      t.string :prefecture, null:false, default: 0
      t.integer :price, null:false
      t.integer :day, null:false, default: 0
      t.integer :delivery_fee, null:false, default: 0
      t.integer :condition, null:false, default: 0
      t.references :category#, null:false, foreign_key:true
      t.references :user#, null:false, foreign_key:true
      t.string :brand
      t.timestamps
    end
  end
end
