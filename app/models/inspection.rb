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
#  granite         :boolean
#  flooring        :boolean
#  appliances      :boolean
#

class Inspection < ActiveRecord::Base
  validates :property, presence: true
  validates :inspector, presence: true
  validates :unit_number, presence: true
  
  has_many :inspection_images
  require 'csv'
  
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
