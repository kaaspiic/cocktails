class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string  :name
      t.string  :ingredients, array: true, default: []
      t.boolean :alcoholic
      t.string  :description
      t.string  :strength

      t.timestamps
    end
  end
end
