class Archive < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ArchiveUploader
end
