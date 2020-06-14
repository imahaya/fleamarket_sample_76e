class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.references :user_id, null: false
      t.references :address_id,null: false
      t.timestamps
    end
  end
end
