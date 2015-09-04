class AddAttachmentPictureToAdventures < ActiveRecord::Migration
  def self.up
    change_table :adventures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :adventures, :picture
  end
end
