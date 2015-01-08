class CatRentalRequestsController < ApplicationController

  def index
    @rentals = CatRentalRequest.all

    render :index
  end

  def new
    @rental = CatRentalRequest.new
    @cats = Cat.all

    render :new
  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    @rental.save

    redirect_to cat_rental_request_url(@rental)
  end

  def show
    @rental = CatRentalRequest.find(params[:id])

    render :show
  end

  def approve_or_deny
    @rental = CatRentalRequest.find(params[:id])
    new_status = params[:new_status]
    if new_status == "Approve"
      @rental.approve!
    elsif new_status == "Deny"
      @rental.deny!
    end

    render :show
  end

  private

  def rental_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end
end
