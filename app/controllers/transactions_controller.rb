class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new
    @transaction.procedure_id = params[:procedure_id]
    @transaction.bill_id = params[:bill_id]
    @transaction.deductible_payment = params[:deductible_payment]
    @transaction.insurance_payment = params[:insurance_payment]
    @transaction.patient_payment = params[:patient_payment]
    @transaction.date = params[:date]

    if @transaction.save
      redirect_to "/transactions", :notice => "Transaction created successfully."
    else
      render 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    @transaction.procedure_id = params[:procedure_id]
    @transaction.bill_id = params[:bill_id]
    @transaction.deductible_payment = params[:deductible_payment]
    @transaction.insurance_payment = params[:insurance_payment]
    @transaction.patient_payment = params[:patient_payment]
    @transaction.date = params[:date]

    if @transaction.save
      redirect_to "/transactions", :notice => "Transaction updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])

    @transaction.destroy

    redirect_to "/transactions", :notice => "Transaction deleted."
  end
end
