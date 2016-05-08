class Benefit < ActiveRecord::Base
  belongs_to :insplan , :class_name => "Insplan", :foreign_key => "insplan_id"
end
