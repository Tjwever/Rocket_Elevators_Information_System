class FormController < ApplicationController
  def index
  end

  def create
    puts "FUNCIONAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"    
    puts 
    
    quote = Quote.new
    quote.NbApparts = params[:NbApparts]
    quote.NbFloors = params[:NbFloors]   
    quote.NbBasements = params[:NbBasements]   

    # quote.save
  end
end
