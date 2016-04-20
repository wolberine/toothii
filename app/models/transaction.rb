class Transaction < ActiveRecord::Base
	belongs_to :procedure
	belongs_to :bill

end
