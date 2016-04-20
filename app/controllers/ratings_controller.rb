class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new
    @rating.bill_id = params[:bill_id]
    @rating.plaque = params[:plaque]
    @rating.gum = params[:gum]
    @rating.tooth = params[:tooth]

    if @rating.save
      redirect_to "/ratings", :notice => "Rating created successfully."
    else
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.bill_id = params[:bill_id]
    @rating.plaque = params[:plaque]
    @rating.gum = params[:gum]
    @rating.tooth = params[:tooth]

    if @rating.save
      redirect_to "/ratings", :notice => "Rating updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    redirect_to "/ratings", :notice => "Rating deleted."
  end
end
