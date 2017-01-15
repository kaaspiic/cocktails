class AddPictureColumnToDrink < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :picture, :string
  end
end
