class AddTotalColstoBills < ActiveRecord::Migration
  def change
    add_column :bills, :total_deductible_payment, :float
    add_column :bills, :total_insurance_payment, :float
    add_column :bills, :total_patient_payment, :float
    add_column :bills, :total_insurance_discount, :float
  end
end
