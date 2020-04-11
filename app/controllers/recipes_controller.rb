class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "レシピ「#{@recipe.name}」を登録しました"
    else
      render :new
    end

  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipes_url, notice: "レシピ「#{@recipe.name}」を更新しました"
    else
      render :edit
    end

  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_url, notice: "レシピ「#{recipe.name}」を削除しました"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image)
  end

end
