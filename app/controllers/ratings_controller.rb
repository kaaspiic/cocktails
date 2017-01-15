class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params.merge(user_id: current_user.id))

    if @rating.save
      head 200
    else
      head 422
    end
  end

  def update
    @rating = Rating.find params[:id]

    if @rating.update(rating_params)
      head 200
    else
      head 422
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :drink_id)
  end
end
