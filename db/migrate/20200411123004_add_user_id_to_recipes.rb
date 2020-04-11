class AddUserIdToRecipes < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM recipes;'
    add_reference :recipes, :user, null: false, index: true
  end

  def down
    remove_reference :recipes, :user, index: true
  end
end
