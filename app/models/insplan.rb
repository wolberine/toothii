class Insplan < ActiveRecord::Base
  has_many :benefits , :class_name => "Benefit", :foreign_key => "insplan_id"
end
