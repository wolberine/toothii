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
    
    counter = 0
    @waterfall_chart_data = Array.new
    @transactions.each do |t| 
      white_hash = { :name => "", :data => [[t.date.to_s, counter]]}
      @waterfall_chart_data.push(white_hash)
      
      temp_hash = { :name => t.id.to_s, :data => [[t.date.to_s,t.patient_payment]] }
      counter = counter + t.patient_payment
      @waterfall_chart_data.push(temp_hash)
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
