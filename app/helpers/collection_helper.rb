module CollectionHelper
  def ingredient_collection
    Drink.pluck(:ingredients).flatten.uniq.compact.reject(&:blank?).map(&:capitalize)
  end
end
