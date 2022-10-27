class AddDeletedAtToInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :deleted_at, :datetime
    add_index :instruments, :deleted_at
  end
end
