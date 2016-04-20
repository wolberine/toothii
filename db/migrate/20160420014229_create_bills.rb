class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :date
      t.integer :patient_id

      t.timestamps

    end
  end
end
