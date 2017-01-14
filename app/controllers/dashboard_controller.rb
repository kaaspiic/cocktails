class DashboardController < ApplicationController
  def show
    @drinks = (
      Drink.joins(:ratings)
           .group('drinks.id')
           .order('COUNT(drinks.id) DESC')
           .limit(12) + Drink.last(12)
    ).uniq.first 12

    @grid = DrinksGrid.new
  end
end
