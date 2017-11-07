class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string   :name, null: false
      t.string   :description
      t.integer  :menus_appeared
      t.integer  :times_appeared
      t.integer  :first_appeared
      t.integer  :last_appeared
      t.decimal  :lowest_price, precision: 32, scale: 16
      t.decimal  :highest_price, precision: 32, scale: 16

      t.timestamps null: false
    end
  end
end
