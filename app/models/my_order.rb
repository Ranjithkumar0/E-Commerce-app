class MyOrder < ApplicationRecord
    paginates_per 1
    
    scope :filter_by_user_id, -> (user_id) { where user_id: user_id} 
end
