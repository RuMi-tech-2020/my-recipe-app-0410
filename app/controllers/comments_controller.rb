class CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_back(fallback_location: recipe_path(@recipe))
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    comment = Comment.find(params[:id])
    if current_user.id == comment.user_id
      comment.destroy
      redirect_to recipe_path(@recipe), notice: "コメント「#{comment.body}」を削除しました"
    end
  end

  private

  # strong parameter の設定
  def comment_params
    params.require(:comment).permit(:body)
  end
end
