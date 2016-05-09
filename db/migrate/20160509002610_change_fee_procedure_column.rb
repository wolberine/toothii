class ChangeFeeProcedureColumn < ActiveRecord::Migration
  def change
    remove_column :fees, :code
    add_column :fees, :procedure_id, :integer
  end
end
