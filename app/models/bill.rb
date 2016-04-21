class Bill < ActiveRecord::Base
	has_many :transactions , :class_name => "Transaction", :foreign_key => "bill_id"
	belongs_to :patient

	def bill_name
		"#{Patient.find(patient_id).name} #{date}"
	end

end
