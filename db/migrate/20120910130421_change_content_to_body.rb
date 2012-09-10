class ChangeContentToBody < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :content, :body
    end
  end
end
