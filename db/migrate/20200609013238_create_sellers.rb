class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.references :user_id, null: false
      t.references :address_id, null: false
      t.timestamps
    end
  end
end
