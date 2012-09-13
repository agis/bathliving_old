class AddAttachmentSlideImageToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :slide_image
    end
  end

  def self.down
    drop_attached_file :projects, :slide_image
  end
end
