class MusicController < ApplicationController

    def index
        @music_instruments = current_user.music_ids
    end

end