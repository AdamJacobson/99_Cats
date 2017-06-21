class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    cat_rental = CatRentalRequest.new(cat_rental_params)
    if cat_rental.save
      redirect_to cat_url(cat_rental_params[:cat_id])
    else
      render text: 'No cat for you'
    end
  end

  def approve
    rental = CatRentalRequest.find_by(id: params[:id])
    rental.approve!
    redirect_to cat_url(rental.cat_id)
  end

  def deny
    rental = CatRentalRequest.find_by(id: params[:id])
    rental.deny!
    redirect_to cat_url(rental.cat_id)
  end

  private

  def cat_rental_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end

end
