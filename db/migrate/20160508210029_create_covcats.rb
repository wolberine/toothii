class CreateCovcats < ActiveRecord::Migration
  def change
    create_table :covcats do |t|
      t.integer :defaultpercent
      t.string :description

      t.timestamps

    end
  end
end
