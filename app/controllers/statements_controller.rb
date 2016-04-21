class StatementsController < ApplicationController
  require 'date' 
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
    @patient = Patient.new
    @transaction = Transaction.new
  end

  def create
    @patient = Patient.new
    @patient.deductible_limit = params[:deductible_limit]
    @patient.phone_number = params[:phone_number]
    @patient.address = params[:address]
    @patient.name = params[:name]
    @patient.benefit_max = params[:benefit_max]
    if @patient.save
      @bill = Bill.new
      @bill.date = DateTime.strptime(params[:date],"%m/%d/%Y")
      @bill.patient_id = @patient.id
      if @bill.save
        redirect_to "/patients", :notice => "Statement #{@bill.id} for Patient #{@patient.id} created successfully."
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])

    @bill.date = params[:date]
    @bill.patient_id = params[:patient_id]

    if @bill.save
      redirect_to "/bills", :notice => "Bill updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @bill = Bill.find(params[:id])

    @bill.destroy

    redirect_to "/bills", :notice => "Bill deleted."
  end
end
