class Checkout < ApplicationRecord
    scope :filter_by_user_id, -> (user_id) { where user_id: user_id} 

    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
