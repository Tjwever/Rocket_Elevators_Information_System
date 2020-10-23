class FormController < ApplicationController
  
  # # GET /form
  # # GET /form.json
  # def index
  #   @quotes = Quote.all
  # end

  # # GET /form/1
  # # GET /form/1.json
  # def show
  # end

  # # GET /form/new
  # def new
  #   @quote = Quote.new
  # end

  # # GET /form/1/edit
  # def edit
  # end

  # POST /form
  # POST /form.json
  def create    
    quote = Quote.new
    quote.nbApparts = params[:NbApparts]
    quote.nbFloors = params[:NbFloors]   
    quote.nbBasements = params[:NbBasements]   
    quote.nbBusiness = params[:NbBusiness]   
    quote.nbParking = params[:NbParking]   
    quote.nbCages = params[:NbCages]   
    quote.nbDistinctTenant = params[:NbDistinctTenant]   
    quote.nbOccup = params[:nbOccup]   
    quote.activity24 = params[:Activity24]   
    quote.elevatorChoice = params[:ElevatorChoice] 
    quote.nbElevator = params[:NbElevator]   
    quote.unitPrice = params[:UnitPrice].delete('$ ,')   
    quote.priceElevator = params[:PriceElevator].delete('$ ,') 
    quote.installationFee = params[:InstallationFee].delete('$ ,')  
    quote.total = params[:Total].delete('$ ,')  

    quote.save
    redirect_to :thank_you
  end

  #  # PATCH/PUT /form/1
  # # PATCH/PUT /form/1.json
  # def update
  #   respond_to do |format|
  #     if @quote.update(quote_params)
  #       format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @quote }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @quote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /form/1
  # # DELETE /form/1.json
  # def destroy
  #   @quote.destroy
  #   respond_to do |format|
  #     format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


end
