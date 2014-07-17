# == Schema Information
#
# Table name: inspections
#
#  id              :integer          not null, primary key
#  property        :string(255)
#  unit_number     :string(255)
#  inspector       :string(255)
#  occupied_rehab  :string(255)
#  turn_rehab      :string(255)
#  inspection_date :string(255)
#  attachments     :string(255)
#  comments        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Inspection < ActiveRecord::Base
  validates :property, presence: true
  validates :inspector, presence: true
  validates :unit_number, presence: true
end
