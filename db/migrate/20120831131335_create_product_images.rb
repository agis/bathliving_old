class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :description
      t.references :product

      t.timestamps
    end
  end
end
