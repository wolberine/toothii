class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :bill_id
      t.integer :plaque
      t.integer :gum
      t.integer :tooth

      t.timestamps

    end
  end
end
