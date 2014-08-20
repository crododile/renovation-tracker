# == Schema Information
#
# Table name: inspections
#
#  id              :integer          not null, primary key
#  property        :string(255)
#  unit_number     :string(255)
#  inspector       :string(255)
#  inspection_date :string(255)
#  attachments     :string(255)
#  comments        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  components      :boolean
#  new_countertop  :boolean
#  flooring        :boolean
#  appliances      :boolean
#  paint           :boolean

class Inspection < ActiveRecord::Base
  validates :property, presence: true
  validates :inspector, presence: true
  validates :unit_number, presence: true
  
  has_many :inspection_images, dependent: :destroy
  require 'csv'
  
  def neighbors
    Property.find_by_property(self.property ||= "Veridian").currentunits
  end
  
  def eql_manager_inspection(manager_inspection)
    wanted = attributes.keys - ["id","created_at", "updated_at", "inspector", "comments", "inspection_date", "attachments"]
    wanted.each do |key|
      return false unless self[key] == manager_inspection[key]
    end
    true
  end
  
  def extract_links
    attachments.split(",")
  end
  
  def self.to_csv( options = {})
    CSV.generate( options ) do |csv|
      wanted = column_names - ["created_at", "updated_at"]
      csv << wanted
      all.each do |inspection|
        csv << inspection.attributes.values_at(*wanted)
      end
    end
  end

end
