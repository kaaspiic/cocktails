module CollectionHelper
  def ingredient_collection
    Drink.pluck(:ingredients).flatten.compact.reject(&:blank?).map(&:capitalize).uniq
  end

  def available_locales
    I18n.available_locales.map { |locale| [locale.to_s.upcase, locale] }
  end
end
