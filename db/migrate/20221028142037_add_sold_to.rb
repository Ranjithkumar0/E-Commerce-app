class AddSoldTo < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :sold_to, :bigint
  end
end
