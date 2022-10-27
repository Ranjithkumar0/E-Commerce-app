class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include CurrentCart
    before_action :set_cart

    def checkout_delete
      @checkout = Checkout.find(params[:id])
      @checkout.destroy
    end

    def delete_instruments
      
      @my_token = Checkout.filter_by_user_id(current_user.id) if user_signed_in?
      @my_order = MyOrder.new()
      
      @my_token.each do |token|
        @my_order.user_id = current_user.id if user_signed_in?
        @my_order.instrument_id = token.instrument_id
        
       @my_order.save
        
        instrument = Instrument.find(token.instrument_id)

        puts instrument.inspect
        instrument.destroy
        token.destroy
        # @my_order.save
      end


    end

  end  