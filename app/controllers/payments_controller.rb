class PaymentsController < ApplicationController
    def index
       @payments = current_user.music_ids
    end 

    def show 
        # @payments =current_user.music_additions
        @payments = current_user.music_ids
        @instrument = LineItem.all
        puts @instrument.to_i
    end

    
    
end
