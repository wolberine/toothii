class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.float :monetaryamt
      t.integer :percent
      t.integer :covcat_id
      t.integer :insplan_id

      t.timestamps

    end
  end
end
