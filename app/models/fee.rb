class Fee < ActiveRecord::Base
  belongs_to :feeschedule , :class_name => "Feeschedule", :foreign_key => "feeschedule_id"
end
