class AddAttachmentPhotoToHostPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :host_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :host_photos, :photo
  end
end
