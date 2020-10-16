class FormController < ApplicationController
  def index
  end

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
    redirect_to :root
  end
end
