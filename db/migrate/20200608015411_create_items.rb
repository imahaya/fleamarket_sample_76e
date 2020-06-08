class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :item_name
      t.timestamps
    end
  end
end
