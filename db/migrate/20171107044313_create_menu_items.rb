class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.integer  :menu_page_id, index: true, foreign_key: true
      t.integer  :dish_id, index: true, foreign_key: true
      t.decimal  :price, precision: 32, scale: 16
      t.decimal  :high_price, precision: 32, scale: 16
      t.decimal  :xpos, precision: 32, scale: 16
      t.decimal  :ypos, precision: 32, scale: 16

      t.timestamps null: false
    end
  end
end
