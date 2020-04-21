class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @comments = @recipe.comments
    # @comments = Comment.find_by(recipe_id: @recipe.id)
    # @user = User.find_by(id: @recipe.comments.user_id)
    @comment = @recipe.comments.build
    # @commenter = User.find_by(id: @comments.user_id)
    # commenter = @recipe.comments.user_id

    # @commenter = User.find_by(id: @comments.user_id)
    @user = User.all
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

  # def user
  #   #インスタンスメソッドないで、selfはインスタンス自身を表す
  #   return User.find_by(id: self.user_id)
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image)
  end

end
