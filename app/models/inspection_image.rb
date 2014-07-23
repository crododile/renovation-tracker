# == Schema Information
#
# Table name: inspection_images
#
#  id                            :integer          not null, primary key
#  inspection_id                 :integer
#  inspection_photo_file_name    :string(255)
#  inspection_photo_content_type :string(255)
#  inspection_photo_file_size    :integer
#  inspection_photo_updated_at   :datetime
#  created_at                    :datetime
#  updated_at                    :datetime
#

class InspectionImage < ActiveRecord::Base
  has_attached_file :inspection_photo, :styles => {
        :big => "600x600>",
        :small => "50x50#"
      }
validates_attachment_content_type :inspection_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
