class ChangeRecipesNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :recipes, :name, :string, limit: 30
  end

  def down
    change_column :recipes, :name, :string
  end
end
