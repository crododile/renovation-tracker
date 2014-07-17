# == Schema Information
#
# Table name: unitcosts
#
#  id         :integer          not null, primary key
#  property   :string(255)
#  unit       :string(255)
#  cost       :string(255)
#  budget     :string(255)
#  date       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Unitcost < ActiveRecord::Base
end
