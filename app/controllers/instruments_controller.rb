class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /instruments
  # GET /instruments.json
  def index
    @instruments = Instrument.all.order("created_at desc").page params[:page]
  end

  # GET /instruments/1
  # GET /instruments/1.json
  def show
  end

  def my_instruments
    @instruments = Instrument.filter_by_user_id(current_user.id).page params[:page] if user_signed_in?
  end

  def add
    @my_token = Checkout.filter_by_user_id(current_user.id) if user_signed_in?

    @my_token.each do |token|
      if ( token.instrument_id == params[:id].to_i )
        redirect_to root_path and return
      end
    end

    @instrument = Instrument.find(params[:id])
    @my_instrument = MyInstrument.new()
    @my_instrument = @instrument

    @my_instrument.save

    @checkout = Checkout.new()
    @checkout.user_id = current_user.id if user_signed_in?
    @checkout.instrument_id = params[:id].to_i
    if @checkout.save
      redirect_to checkout_index_path
    else
      redirect_to root_path
    end
  end

  # GET /instruments/new
  def new
    @instrument = current_user.instruments.build
  end

  # GET /instruments/1/edit
  def edit
  end

  
  # POST /instruments
  # POST /instruments.json
  def create
    @instrument = current_user.instruments.build(instrument_params)

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: 'Instrument was successfully created.' }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1
  # PATCH/PUT /instruments/1.json
  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: 'Instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1
  # DELETE /instruments/1.json
  def destroy
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: 'Instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def music  
    type = params[:type]
    if type == "add"
      current_user.music_ids << @instrument 
    elsif type == "remove"
      current_user.music_ids.delete(@instrument)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
    end
end