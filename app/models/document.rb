class Document < ApplicationRecord
  belongs_to :subject
  mount_uploader :doc, DocumentUploader
  belongs_to :company
end
