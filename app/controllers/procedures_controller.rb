class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new
    @procedure.description = params[:description]
    @procedure.code = params[:code]

    if @procedure.save
      redirect_to "/procedures", :notice => "Procedure created successfully."
    else
      render 'new'
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    @procedure = Procedure.find(params[:id])

    @procedure.description = params[:description]
    @procedure.code = params[:code]

    if @procedure.save
      redirect_to "/procedures", :notice => "Procedure updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])

    @procedure.destroy

    redirect_to "/procedures", :notice => "Procedure deleted."
  end
end
