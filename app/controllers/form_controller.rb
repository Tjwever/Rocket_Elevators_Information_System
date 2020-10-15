class FormController < ApplicationController
  def index
  end

  def create


    puts 
    
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
    quote.UnitPrice = params[:UnitPrice]   
    quote.PriceElevator = params[:PriceElevator] 
    quote.InstallationFee = params[:InstallationFee]   
    quote.Total = params[:Total]    


    # quote.save
  end
end
