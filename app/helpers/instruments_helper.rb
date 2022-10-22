module InstrumentsHelper

    def instrument_author(instrument)
      user_signed_in? && current_user.id == instrument.user_id
    end
    def instrument_added_to_music? user, instrument
      user.musics.where(user: user, instrument: instrument).any?
    end
  
  end   