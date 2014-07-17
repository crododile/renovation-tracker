# == Schema Information
#
# Table name: productionschedules
#
#  id                  :integer          not null, primary key
#  property            :string(255)
#  unit                :string(255)
#  componentrehabdate  :string(255)
#  floorapplirehabdate :string(255)
#  blank               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class Productionschedule < ActiveRecord::Base
end
