class CreateMyInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :my_instruments do |t|
      t.string "brand"
      t.string "model"
      t.text "description"
      t.string "condition"
      t.string "finish"
      t.string "title"
      t.decimal "price", precision: 5, scale: 2, default: "0.0"
      t.string "image"
      t.integer "user_id"

      t.timestamps
    end
  end
end
