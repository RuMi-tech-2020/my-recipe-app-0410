class ChangeRecipesNameNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :recipes, :name, false
  end
end
