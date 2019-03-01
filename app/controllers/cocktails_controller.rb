class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
  	@cocktails = Cocktail.all
  end

  def show
  end

  def new
  	@cocktail = Cocktail.new
  end

  def create
  	@cocktail = Cocktail.new(cocktail_params)
  	if @cocktail.save
  		redirect_to cocktail_path(@cocktail) 
  	else
  		render :new
  	end
  end

  private

  def set_cocktail
  	@cocktail = Cocktail.find(params[:id])
    # example: Cocktail.find(1) -> #<Cocktail id: 1, name: "Magaritha", created_at: "2019-02-28 14:53:39", updated_at: "2019-02-28 14:53:39">
    # = an object from an array (Coctail = an array with objects)
    # if you want to create one: Cocktail.create(name: "test5")
  	# refactoring
  end

  def cocktail_params
  	params.require(:cocktail).permit(:name) 
  	# whitelistening
  end
end

#                 cocktails GET  /cocktails(.:format)                                                                     cocktails#index
#                           POST /cocktails(.:format)                                                                     cocktails#create
#              new_cocktail GET  /cocktails/new(.:format)                                                                 cocktails#new
#                  cocktail GET  /cocktails/:id(.:format)  

