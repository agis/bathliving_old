ActiveAdmin.register Product do
  form multipart: true do |f|
    f.inputs "Product Information" do
      f.input :name
      f.input :description
    end

    f.inputs "Product Images" do
      f.has_many :images do |p|
        p.input :file, hint: p.template.image_tag(p.object.file.url(:default))
      end
    end

    f.buttons
  end
end
