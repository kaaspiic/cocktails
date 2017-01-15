class DrinksGrid
  include Datagrid

  scope do
    Drink
  end

  filter :name, header: Drink.human_attribute_name(:name)

  filter(
    :ingredients,
    :enum,
    select: ApplicationController.helpers.ingredient_collection,
    header: Drink.human_attribute_name(:ingredients),
    multiple: true,
    input_html: { data: { component: 'Select2' } }
  ) do |value|
    where("ingredients::text[] @> ARRAY[#{value.map { |v| "'#{v}'" }.join(', ')}]")
  end

  filter(
    :strength,
    :enum,
    select: ApplicationController.helpers.strengths_collection,
    header: Drink.human_attribute_name(:strength),
    input_html: { data: { component: 'Select2' } }
  )

  filter(
    :user_id,
    :enum,
    select: User.all.map { |u| [u.to_s, u.id] },
    header: Drink.human_attribute_name(:user_id),
    multiple: true,
    input_html: { data: { component: 'Select2' } }
  )

  column :name do |drink|
    format drink do
      link_to drink, drink_path(drink)
    end
  end
  column :description
end
