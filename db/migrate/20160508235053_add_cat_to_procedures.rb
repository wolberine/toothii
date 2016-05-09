class AddCatToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :covcat_id, :integer
  end
end
