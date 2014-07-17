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
  has_many :currentunits,
   :primary_key => "property",
   :foreign_key => "property",
   :class_name => "Currentunit"
end
