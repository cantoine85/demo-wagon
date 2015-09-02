class AddAttachmentPictureToExperiences < ActiveRecord::Migration
  def self.up
    change_table :experiences do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :experiences, :picture
  end
end
