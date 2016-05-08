class InsplansController < ApplicationController
  def index
    @insplans = Insplan.all
  end

  def show
    @insplan = Insplan.find(params[:id])
  end

  def new
    @insplan = Insplan.new
  end

  def create
    @insplan = Insplan.new
    @insplan.annualmax = params[:annualmax]
    @insplan.deductible = params[:deductible]
    @insplan.groupname = params[:groupname]

    if @insplan.save
      redirect_to "/insplans", :notice => "Insplan created successfully."
    else
      render 'new'
    end
  end

  def edit
    @insplan = Insplan.find(params[:id])
  end

  def update
    @insplan = Insplan.find(params[:id])

    @insplan.annualmax = params[:annualmax]
    @insplan.deductible = params[:deductible]
    @insplan.groupname = params[:groupname]

    if @insplan.save
      redirect_to "/insplans", :notice => "Insplan updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @insplan = Insplan.find(params[:id])

    @insplan.destroy

    redirect_to "/insplans", :notice => "Insplan deleted."
  end
end
