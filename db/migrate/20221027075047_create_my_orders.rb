class CreateMyOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :my_orders do |t|
      t.bigint "user_id"
      t.bigint "instrument_id"
      
      t.timestamps
    end
  end
end
