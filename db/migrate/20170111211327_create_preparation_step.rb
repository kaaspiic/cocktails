class CreatePreparationStep < ActiveRecord::Migration[5.0]
  def change
    create_table :preparation_steps do |t|
      t.integer :drink_id
      t.string  :title
      t.string  :description
      t.string  :time_needed

      t.timestamps
    end
  end
end
