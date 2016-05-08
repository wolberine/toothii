class CreateFeeschedules < ActiveRecord::Migration
  def change
    create_table :feeschedules do |t|
      t.string :description

      t.timestamps

    end
  end
end
