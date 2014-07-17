# == Schema Information
#
# Table name: inspectors
#
#  id         :integer          not null, primary key
#  inspector  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Inspector < ActiveRecord::Base
end
