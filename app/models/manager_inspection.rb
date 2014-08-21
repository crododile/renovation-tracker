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
  
  def most_recent_covenant_inspection
    Inspection.where(property: property).where(unit_number: unit_number).order("updated_at DESC").first
  end
  
  def get_css_by_agreement(attribute, covenant_inspection= most_recent_covenant_inspection)
    return "" if !self[attribute]
    return "pending" if !covenant_inspection
    return "matches" if covenant_inspection[attribute] == true
    return "mismatch" if  !covenant_inspection[attribute]
  end
end
