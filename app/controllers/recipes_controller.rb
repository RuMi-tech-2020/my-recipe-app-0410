class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save!
    redirect_to recipes_url, notice: "レシピ「#{recipe.name}」を登録しました"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update!(recipe_params)
    redirect_to recipes_url, notice: "レシピ「#{recipe.name}」を更新しました"
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_url, notice: "レシピ「#{recipe.name}」を削除しました"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

end
