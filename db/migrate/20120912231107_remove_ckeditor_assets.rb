class RemoveCkeditorAssets < ActiveRecord::Migration
  def change
    drop_table :ckeditor_assets
  end
end
