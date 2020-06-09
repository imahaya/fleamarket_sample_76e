class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :city, null: false
      t.string :address,null: false
      t.timestamps
    end
  end
end
