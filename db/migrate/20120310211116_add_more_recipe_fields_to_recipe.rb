class AddMoreRecipeFieldsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :text
  end
end
