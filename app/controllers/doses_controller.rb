class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: "Dose was Succesfully created!"
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: "Dose was Succesfully Deleted!"
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end


# dose.description = "Add 5 leaves"
# dose.cocktail = Cocktail.find(1)
# dose.ingredient = Ingredient.find(4)
