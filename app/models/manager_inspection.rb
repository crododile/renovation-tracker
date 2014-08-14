# == Schema Information
#
# Table name: manager_inspections
#
#  id             :integer          not null, primary key
#  components     :boolean
#  new_countertop :boolean
#  flooring       :boolean
#  appliances     :boolean
#  paint          :boolean
#  rent_ready     :boolean
#  property       :string(255)
#  unit_number    :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  currentunit_id :integer
#

class ManagerInspection < ActiveRecord::Base
  belongs_to :currentunit
  
end
