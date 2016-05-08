class Feeschedule < ActiveRecord::Base
  has_many :fees , :class_name => "Fee", :foreign_key => "feeschedule_id"
end
