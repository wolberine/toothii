class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.string :code
      t.integer :feeschedule_id
      t.float :amount

      t.timestamps

    end
  end
end
