class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :procedure_id
      t.integer :bill_id
      t.float :deductible_payment
      t.float :insurance_payment
      t.float :patient_payment
      t.date :date

      t.timestamps

    end
  end
end
