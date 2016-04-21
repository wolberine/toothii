class AddPatientIDtoTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :patient_id, :integer
  end
end
