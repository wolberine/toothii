class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new
    @patient.deductible_limit = params[:deductible_limit]
    @patient.phone_number = params[:phone_number]
    @patient.address = params[:address]
    @patient.name = params[:name]

    if @patient.save
      redirect_to "/patients", :notice => "Patient created successfully."
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    @patient.deductible_limit = params[:deductible_limit]
    @patient.phone_number = params[:phone_number]
    @patient.address = params[:address]
    @patient.name = params[:name]

    if @patient.save
      redirect_to "/patients", :notice => "Patient updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])

    @patient.destroy

    redirect_to "/patients", :notice => "Patient deleted."
  end
end
