class CovcatsController < ApplicationController
  def index
    @covcats = Covcat.all
  end

  def show
    @covcat = Covcat.find(params[:id])
  end

  def new
    @covcat = Covcat.new
  end

  def create
    @covcat = Covcat.new
    @covcat.defaultpercent = params[:defaultpercent]
    @covcat.description = params[:description]

    if @covcat.save
      redirect_to "/covcats", :notice => "Covcat created successfully."
    else
      render 'new'
    end
  end

  def edit
    @covcat = Covcat.find(params[:id])
  end

  def update
    @covcat = Covcat.find(params[:id])

    @covcat.defaultpercent = params[:defaultpercent]
    @covcat.description = params[:description]

    if @covcat.save
      redirect_to "/covcats", :notice => "Covcat updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @covcat = Covcat.find(params[:id])

    @covcat.destroy

    redirect_to "/covcats", :notice => "Covcat deleted."
  end
end
