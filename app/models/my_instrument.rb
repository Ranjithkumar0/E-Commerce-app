class MyInstrument < ApplicationRecord
    belongs_to :user, optional: true
    has_many :line_items
    has_one_attached :image
end
