class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.integer  :actual_menu_item_id, index: true
      t.integer  :actual_menu_page_id, index: true, foreign_key: true
      t.integer  :actual_dish_id, index: true, foreign_key: true
      t.decimal  :price, precision: 32, scale: 16
      t.decimal  :high_price, precision: 32, scale: 16
      t.datetime :actual_created_at
      t.datetime :actual_updated_at

      t.timestamps null: false
    end
  end
end
