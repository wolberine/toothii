class Patient < ActiveRecord::Base
	has_many :bills , :class_name => "Bill", :foreign_key => "patient_id"
	
end
