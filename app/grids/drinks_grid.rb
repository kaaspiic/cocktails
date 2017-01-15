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

  column :strength do |drink|
    I18n.t("collections.strengths")[drink.strength.to_i]
  end

  column :description do |drink|
    format drink do
      ActiveSupport::SafeBuffer.new.tap do |content|
        content << content_tag(:span, drink.description.truncate(100), id: drink.id)
        text = "<strong>#{drink.name.capitalize}</strong><br>#{drink.description}".html_safe
        content << content_tag(:div, text, class: 'mdl-tooltip mdl-tooltip--large', for: drink.id)
      end
    end
  end

  column(
    :rating,
    order: proc { |scope| scope.left_joins(:ratings).group(:id).order('AVG(ratings.score)') }
  ) do |drink|
    drink.average_rating
  end

  column :ratings_count, order: proc { |scope| scope.left_joins(:ratings).group(:id).order('COUNT(drink_id)') } do |drink|
    drink.ratings.count
  end
end

