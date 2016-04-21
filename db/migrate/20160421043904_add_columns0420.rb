class AddColumns0420 < ActiveRecord::Migration
  def change
  	add_column :transactions, :location, :text
  	add_column :procedures, :long_description, :text
  end
end
