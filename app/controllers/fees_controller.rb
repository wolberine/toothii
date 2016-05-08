class FeesController < ApplicationController
  def index
    @fees = Fee.all
  end

  def show
    @fee = Fee.find(params[:id])
  end

  def new
    @fee = Fee.new
  end

  def create
    @fee = Fee.new
    @fee.code = params[:code]
    @fee.feeschedule_id = params[:feeschedule_id]
    @fee.amount = params[:amount]

    if @fee.save
      redirect_to "/fees", :notice => "Fee created successfully."
    else
      render 'new'
    end
  end

  def edit
    @fee = Fee.find(params[:id])
  end

  def update
    @fee = Fee.find(params[:id])

    @fee.code = params[:code]
    @fee.feeschedule_id = params[:feeschedule_id]
    @fee.amount = params[:amount]

    if @fee.save
      redirect_to "/fees", :notice => "Fee updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @fee = Fee.find(params[:id])

    @fee.destroy

    redirect_to "/fees", :notice => "Fee deleted."
  end
end
