class Arquivo < ActiveRecord::Base
  attr_accessor :attachment, :name, :brand, :bank
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  validates :brand, presence: true # Make sure the brand is present.
  validates :bank, presence: true # Make sure the bank is present.
  validates :attachment, presence: true # Make sure the attachment is present.
end