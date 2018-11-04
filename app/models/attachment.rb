class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  validates :file, presence: true
end
