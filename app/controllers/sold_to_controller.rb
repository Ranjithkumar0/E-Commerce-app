class SoldToController < ApplicationController
    def index
        @instruments = Instrument.filter_by_user_id(current_user.id).page params[:page]
    end
end
