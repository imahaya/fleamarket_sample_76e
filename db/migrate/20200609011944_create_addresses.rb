class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :shopping_family_name              #null: false
      # t.string :shopping_first_name               #null: false
      # t.string :shopping_family_name_kana         #null: false
      # t.string :shopping_first_name_kana          #null: false
      # t.integer :post_code               #null: false
      # t.integer :prefecture_code #null: false
      # t.string :city #null: false
      # t.string :address #null: false
      # t.integer :phone_number,limit: 8           #null: false
      t.timestamps
    end
  end
end
