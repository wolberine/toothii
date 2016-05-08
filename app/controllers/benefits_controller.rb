class BenefitsController < ApplicationController
  def index
    @benefits = Benefit.all
  end

  def show
    @benefit = Benefit.find(params[:id])
  end

  def new
    @benefit = Benefit.new
  end

  def create
    @benefit = Benefit.new
    @benefit.monetaryamt = params[:monetaryamt]
    @benefit.percent = params[:percent]
    @benefit.covcat_id = params[:covcat_id]
    @benefit.insplan_id = params[:insplan_id]

    if @benefit.save
      redirect_to "/benefits", :notice => "Benefit created successfully."
    else
      render 'new'
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
  end

  def update
    @benefit = Benefit.find(params[:id])

    @benefit.monetaryamt = params[:monetaryamt]
    @benefit.percent = params[:percent]
    @benefit.covcat_id = params[:covcat_id]
    @benefit.insplan_id = params[:insplan_id]

    if @benefit.save
      redirect_to "/benefits", :notice => "Benefit updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @benefit = Benefit.find(params[:id])

    @benefit.destroy

    redirect_to "/benefits", :notice => "Benefit deleted."
  end
end
