class FormController < ApplicationController
  
  def index
  end

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
end
