class BillsController < ApplicationController
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
  end

  def create
    @bill = Bill.new
    @bill.date = params[:date]
    @bill.patient_id = params[:patient_id]

    if @bill.save
      redirect_to "/bills", :notice => "Bill created successfully."
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
