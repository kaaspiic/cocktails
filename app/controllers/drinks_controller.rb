class DrinksController < ApplicationController
  def index
    @grid = DrinksGrid.new(params[:drinks_grid])
  end
end
