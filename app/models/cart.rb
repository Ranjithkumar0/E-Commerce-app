class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_instrument(instrument)
    current_item = line_items.find_by(instrument_id: instrument.id)
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end