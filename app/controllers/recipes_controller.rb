class RecipesController < ApplicationController
  expose(:recipe)
  expose(:recipes) { Recipe.all }


  def create
    if recipe.save
      redirect_to recipes_url, notice: 'Recipe was successfully created.'
    else
       render action: "new"
    end
  end

  def update
    if recipe.update_attributes(params[:recipe])
      redirect_to recipe, notice: 'Recipe was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    recipe.destroy
    redirect_to recipes_url
  end
end
