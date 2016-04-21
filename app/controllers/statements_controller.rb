class StatementsController < ApplicationController
  require 'date' 
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @transactions = Transaction.where({ :bill_id => params[:id] })

    @total_insurance_payment = 0.to_f
    @total_patient_payment = 0.to_f

    @transactions.each do |t|
      @total_insurance_payment = @total_insurance_payment + t.insurance_payment
      @total_patient_payment = @total_patient_payment + t.patient_payment
    end
    @total_payment = 0.to_f 
    @total_payment = @total_insurance_payment + @total_patient_payment

    @bar_chart_data = [
    {
      name: "Insurance Payment", 
      data: [["Payment Breakdown", @total_insurance_payment]]
    },
    {
      name: "Patient Payment", 
      data: [["Payment Breakdown", @total_patient_payment]]
    }
    ]
    @timeline_chart_data = Hash.new
    
    bottom_layer = Array.new
    previous_id = 0
    @transactions.each do |t|
      temp_hash = Hash.new
      @timeline_chart_data[previous_id] = bottom_layer.reduce(0, :+)

      @timeline_chart_data[t.procedure_id] = t.patient_payment
      
      bottom_layer.push(t.patient_payment)

      previous_id = t.procedure_id

    end
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
        @transaction = Transaction.new
        @transaction.patient_id = @patient.id
        @transaction.bill_id = @bill.id
        @transaction.procedure_id = params[:procedure_id]
        @transaction.deductible_payment = params[:deductible_payment]
        @transaction.insurance_payment = params[:insurance_payment]
        @transaction.patient_payment = params[:patient_payment]
        @transaction.date = @bill.date
        @transaction.location = params[:location]
          if @transaction.save
            redirect_to "/statements", :notice => "Statement #{@bill.id} for Patient #{@patient.id} for Treatment #{@transaction.id} created successfully."
          else
            render 'new'
          end
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
