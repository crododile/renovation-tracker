# == Schema Information
#
# Table name: acquisitionunits
#
#  id          :integer          not null, primary key
#  property    :string(255)
#  unit_number :string(255)
#  unit_type   :string(255)
#  square_feet :string(255)
#  rent        :string(255)
#  date        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Acquisitionunit < ActiveRecord::Base
end
