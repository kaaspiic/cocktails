class DrinksController < ApplicationController
  before_action :load_drink, only: [:show, :edit, :update, :destroy, :picture]
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
      upload_picture
      redirect_to drink_path @drink
    else
      render :new
    end
  end

  def update
    upload_picture

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

  def picture
    render plain: open("public/uploads/#{@drink.id}.png", 'rb').read, content_type: 'image/jpg'
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :strength, ingredients: [],
      preparation_steps_attributes: [:id, :drink_id, :title, :description, :time_needed, :_destroy]
    )
  end

  def load_drink
    @drink = Drink.find(params[:id])
  end

  def check_write_permissions
    return if current_user == @drink.user
    flash.alert = t('.no_write_permissions')
    redirect_to(drink_path @drink)
  end

  def upload_picture
    if picture = params[:drink].delete(:picture)
      path = File.dirname(Rails.root.join('public', 'uploads', @drink.id.to_s))
      FileUtils.mkdir_p path
      File.open("#{path}/#{@drink.id}.png", 'wb') { |file| file.write(picture.read) }
    end
  end
end


