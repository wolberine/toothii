class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :description
      t.string :code

      t.timestamps

    end
  end
end
