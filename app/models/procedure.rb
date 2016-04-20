class Procedure < ActiveRecord::Base
	has_many :transactions , :class_name => "Transaction", :foreign_key => "procedure_id"
end
