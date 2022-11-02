class PaymentsController < ApplicationController
    def index
       @payments = current_user.music_ids
    end 

    def show 
        @payments = current_user.music_ids
        @instrument = LineItem.all
        puts @instrument.to_a

        delete_instruments
        
    end

    
    
end
