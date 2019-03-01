class DosesController < ApplicationController
  def new
  	@cocktail = Cocktail.find(params[:cocktail_id]) # not needed I think
    @dose = Dose.new
    # initialize a new one!
  end

  def create
  	@dose = Dose.new(dose_params)
  	# the description
  	# the ingredient is being taken automatically
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	# cocktail_id not cocktail due to parans path: check rails routes!
  	@dose.cocktail = @cocktail
  	if @dose.save
  		redirect_to cocktails_path
  	else 
  		render :new
  	end
  	
  end

  def destroy
  	# puts "-"*50 -> testing in rails s -> better to test in the rails c, but make sure you have a DB at your disposal 
  	# otherwise .create (new + save) new which you can find afterwards (new = initialize?)
  	# puts params
  	@dose = Dose.find(params[:id])
  	# NOT @cocktail = Cocktail.find(params[:cocktail_id]) -> finding in the DB using the params of the URL
   	@dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
    # Dose.all
    # Dose.find -> get one from the DB using the params form the URL! -> Not: watch rails routes to see the path! which is why it is cocktail_id
    # not id here, since we are within the doses_controller.rb, so no direct access to id -> has to go through cocktail_id
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
    # ingredient_id -> CHECK HTML: FORM = (name: dose[ingredient_id]) (no other way of knowing)
  end

end
