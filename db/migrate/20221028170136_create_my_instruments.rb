class CreateMyInstruments < ActiveRecord::Migration[6.1]
  def change
    drop_table :my_instruments
    
    create_table :my_instruments do |t|
      t.bigint "user_id"
      t.bigint "instrument_id"
      
      t.timestamps
    end
  end
end
