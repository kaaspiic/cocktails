class DrinksGrid
  include Datagrid

  scope do
    Drink
  end

  filter :name
  filter :ingredients
  filter :alcoholic, :boolean
  filter :strength

  column :name
  column :description
end
