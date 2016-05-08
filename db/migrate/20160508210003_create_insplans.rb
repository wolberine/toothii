class CreateInsplans < ActiveRecord::Migration
  def change
    create_table :insplans do |t|
      t.float :annualmax
      t.float :deductible
      t.string :groupname

      t.timestamps

    end
  end
end
