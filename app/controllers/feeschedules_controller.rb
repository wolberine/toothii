class FeeschedulesController < ApplicationController
  def index
    @feeschedules = Feeschedule.all
  end

  def show
    @feeschedule = Feeschedule.find(params[:id])
  end

  def new
    @feeschedule = Feeschedule.new
  end

  def create
    @feeschedule = Feeschedule.new
    @feeschedule.description = params[:description]

    if @feeschedule.save
      redirect_to "/feeschedules", :notice => "Feeschedule created successfully."
    else
      render 'new'
    end
  end

  def edit
    @feeschedule = Feeschedule.find(params[:id])
  end

  def update
    @feeschedule = Feeschedule.find(params[:id])

    @feeschedule.description = params[:description]

    if @feeschedule.save
      redirect_to "/feeschedules", :notice => "Feeschedule updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @feeschedule = Feeschedule.find(params[:id])

    @feeschedule.destroy

    redirect_to "/feeschedules", :notice => "Feeschedule deleted."
  end
end
