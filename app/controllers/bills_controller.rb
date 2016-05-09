class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @transactions = Transaction.where({ :bill_id => params[:id] })

    @total_insurance_payment = 0.to_f
    @total_patient_payment = 0.to_f
    @total_deductible_payment = 0.to_f

    @transactions.each do |t|
      @total_insurance_payment = @total_insurance_payment + t.insurance_payment
      @total_patient_payment = @total_patient_payment + t.patient_payment
      @total_deductible_payment = @total_deductible_payment + t.deductible_payment
    end
    @total_payment = 0.to_f 
    @total_payment = @total_insurance_payment + @total_patient_payment + @total_deductible_payment

    @google_bar_chart_data = [@total_insurance_payment,@total_patient_payment,@total_deductible_payment]

      #["Type of payment","Insurance Payment", { role: "annotation" },"Patient Payment", { role: "annotation" },"Deductible Payment", { role: "annotation" }],
      #["Payment Breakdown", @total_insurance_payment,"hi" ,@total_patient_payment, "hi",@total_deductible_payment,"hi"]
      #["Type of payment", "Payment"],
      #["Insurance Payment", @total_insurance_payment],
      #["Patient Payment", @total_patient_payment],
      #["Deductible Payment", @total_deductible_payment]
    

#so... this is confusing... patient payment is co-insurance, but need to add deductible to get everything the patient
#actually pays
    
    counter = 0
    @waterfall_chart_data = Array.new
    @procedure_chart_data = Array.new #this array is for the charge breakdown
    @transactions.each do |t| 
      white_hash = { :name => "", :data => [[t.date.to_s, counter]]}
      @waterfall_chart_data.push(white_hash)
      
      temp_hash = { :name => t.id.to_s, :data => [[t.date.to_s,t.patient_payment+t.deductible_payment]] }
      counter = counter + t.patient_payment + t.deductible_payment
      @waterfall_chart_data.push(temp_hash)


    end

    current = 0
    previous = 0
    @google_waterfall_chart_data = Array.new
    #need to sort transactions by date
    @transactions.each do |t|
      current = current + t.patient_payment
      array_element = [t.date.to_s, previous, previous, current, current]
      @google_waterfall_chart_data.push(array_element)
      previous = current
    end

    @show_for_printing = 1

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
