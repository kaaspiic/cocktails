module CollectionHelper
  def ingredient_collection
    Drink.pluck(:ingredients).flatten.uniq.map { |i| [i.capitalize, i] }
  end

  def available_locales
    I18n.available_locales.map { |locale| [locale.to_s.upcase, locale] }
  end

  def strengths_collection
    (1..5).map { |i| [I18n.t("collections.strengths")[i], i] }
  end
end
