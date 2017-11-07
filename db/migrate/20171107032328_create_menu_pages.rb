class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.integer  :menu_id, index: true, foreign_key: true
      t.integer  :page_number
      t.integer  :image_id, limit: 8
      t.integer  :full_height
      t.integer  :full_width
      t.uuid     :uuid

      t.timestamps null: false
    end
  end
end
