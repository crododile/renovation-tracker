# == Schema Information
#
# Table name: properties
#
#  id             :integer          not null, primary key
#  fund           :string(255)
#  manager        :string(255)
#  property       :string(255)
#  units          :string(255)
#  city           :string(255)
#  state          :string(255)
#  purchase_price :string(255)
#  twophaserehab  :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Property < ActiveRecord::Base
  # NB javascript population of drop down plucks unit numbers,
  # erb version gets whole model from association
  has_many :currentunits, -> {order "unit_number ASC"},
   :primary_key => "property",
   :foreign_key => "property",
   :class_name => "Currentunit"
   
   def unit_numbers
     currentunits.order('unit_number ASC').uniq.pluck('unit_number')
   end
   
   def inspections
     Inspection.where(property: property).order('unit_number ASC')
   end
   
   def manager_inspections
     ManagerInspection.where(property: property).order('unit_number ASC')
   end


end
