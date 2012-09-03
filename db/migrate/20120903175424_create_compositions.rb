class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
