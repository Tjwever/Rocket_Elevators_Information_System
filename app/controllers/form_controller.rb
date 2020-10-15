class FormController < ApplicationController
  def index
  end

  def create
    # @quotes = Quote.new(my_params)

    puts "FUNCIONAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    
    puts params[:NbApparts]
    
    # qu = Quote.new
    # qu.totalCost = 15
    # qu.InstallationFee = 30 
    # qu.TotalNBofElevator = 80
    # qu.save
    # puts @quotes.NbApparts

    # @quotes.save
  end
end
