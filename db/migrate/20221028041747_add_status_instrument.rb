class AddStatusInstrument < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :status, :string, default: "active"
  end
end
