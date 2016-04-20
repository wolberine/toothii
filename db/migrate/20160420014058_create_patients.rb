class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.float :deductible_limit
      t.string :phone_number
      t.string :address
      t.string :name

      t.timestamps

    end
  end
end
