class Transaction < ActiveRecord::Base
	belongs_to :procedure
	belongs_to :bill
	belongs_to :patient

end
