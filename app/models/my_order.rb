class MyOrder < ApplicationRecord
    scope :filter_by_user_id, -> (user_id) { where user_id: user_id} 
end
