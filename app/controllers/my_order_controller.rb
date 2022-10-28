class MyOrderController < ApplicationController
    def index
        @my_order = MyOrder.filter_by_user_id(current_user.id).order("created_at desc").paginate(page: params[:page], per_page: 10) if user_signed_in?
    end
end
