class DashboardController < ApplicationController
  def show
    @drinks = (
      Drink.joins(:ratings)
           .group('drinks.id')
           .order('COUNT(drinks.id) DESC')
           .limit(10) + Drink.last(10)
    ).uniq.first 10

    @grid = DrinksGrid.new
  end
end
