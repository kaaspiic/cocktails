class DrinksGrid
  include Datagrid

  scope do
    Drink
  end

  filter :name
  filter :ingredients
  filter :alcoholic, :boolean
  filter :strength

  column :name do |drink|
    format drink do
      link_to drink, drink_path(drink)
    end
  end
  column :description
end
