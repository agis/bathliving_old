ActiveAdmin.register Product do
  form multipart: true do |f|
    f.inputs do
      f.input :name
      f.input :description
    end

    f.inputs "Product Images" do
      f.has_many :images do |p|
        p.input :file
      end
    end
    f.buttons
  end
end
