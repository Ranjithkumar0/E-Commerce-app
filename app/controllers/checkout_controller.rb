class CheckoutController < ApplicationController
    def index
        @my_token = Checkout.filter_by_user_id(current_user.id) if user_signed_in?
    end

    def show
        checkout_delete()
        redirect_to checkout_index_path and return
    end
end
