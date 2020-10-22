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
    quote.NbApparts = params[:NbApparts]
    quote.NbFloors = params[:NbFloors]   
    quote.NbBasements = params[:NbBasements]   
    quote.NbBusiness = params[:NbBusiness]   
    quote.NbParking = params[:NbParking]   
    quote.NbCages = params[:NbCages]   
    quote.NbDistinctTenant = params[:NbDistinctTenant]   
    quote.nbOccup = params[:nbOccup]   
    quote.Activity24 = params[:Activity24]   
    quote.ElevatorChoice = params[:ElevatorChoice] 
    quote.NbElevator = params[:NbElevator]   
    quote.UnitPrice = params[:UnitPrice].delete('$ ,')   
    quote.PriceElevator = params[:PriceElevator].delete('$ ,') 
    quote.InstallationFee = params[:InstallationFee].delete('$ ,')  
    quote.Total = params[:Total].delete('$ ,')  

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
