class AddBenefitMaxToPatients < ActiveRecord::Migration
  def change
  	add_column :patients, :benefit_max, :float
  end
end
