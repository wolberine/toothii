class AddColumnToBills < ActiveRecord::Migration
  def change
    add_column :bills, :bill_note, :text
  end
end
