class RenameCompositionsToProjects < ActiveRecord::Migration
  def change
    rename_table :compositions, :projects
  end
end
