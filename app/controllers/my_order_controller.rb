class MyOrderController < ApplicationController
    def index
        @my_order = MyOrder.filter_by_user_id(current_user.id) if user_signed_in?
    end
end
