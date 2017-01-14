class DrinksController < ApplicationController
  before_action :load_drink, only: [:show, :edit, :update, :destroy]
  before_action :check_write_permissions, only: [:edit, :update, :destroy]

  def index
    @grid = DrinksGrid.new(params[:drinks_grid])
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params.merge(user_id: current_user.id))

    if @drink.save
      redirect_to drink_path @drink
    else
      render :new
    end
  end


  def update
    if @drink.update(drink_params)
      redirect_to drink_path @drink
    else
      render :edit
    end
  end

  def destroy
    @drink.destroy
    redirect_to drinks_path
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :alcoholic, :strength, ingredients: [])
  end

  def load_drink
    @drink = Drink.find(params[:id])
  end

  def check_write_permissions
    flash.alert = t('.no_write_permissions')
    redirect_to(drink_path @drink) unless current_user == @drink.user
  end
end

