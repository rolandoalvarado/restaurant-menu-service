class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.integer  :actual_menu_id, index: true, foreign_key: true
      t.integer  :actual_menu_page_id, index: true
      t.integer  :page_number
      t.integer  :image_id
      t.integer  :full_height
      t.integer  :full_width
      t.uuid     :menu_page_uuid

      t.timestamps null: false
    end
  end
end
