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
  
  MATCHER_ATTRIBUTES = [
    "components",
    "new_countertop",
    "flooring",
    "appliances",
    "paint"
  ]
  
  def most_recent_covenant_inspection
    Inspection.where(property: property).where(unit_number: unit_number).order("inspection_date DESC").first
  end
  
  def get_css_by_agreement(attribute, covenant_inspection= most_recent_covenant_inspection)
    return "" if !self[attribute]
    return "pending" if !covenant_inspection
    return "matches" if covenant_inspection[attribute] == true
    return "mismatch" if  !covenant_inspection[attribute]
  end
  
  def match_data
    match_data = []
    MATCHER_ATTRIBUTES.each do |att|
      match_data << get_css_by_agreement(att)
    end
    match_data
  end
end
