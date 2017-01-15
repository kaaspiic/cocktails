class RemoveColumnAlcoholicFromDrinks < ActiveRecord::Migration[5.0]
  def change
    remove_column :drinks, :alcoholic
  end
end
