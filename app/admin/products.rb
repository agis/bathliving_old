ActiveAdmin.register Product do
  form multipart: true do |f|
    f.inputs "Basic Information" do
      f.input :name
      f.input :description, as: :ckeditor, input_html: { height: 500 }
    end

    f.inputs "Images" do
      f.has_many :images do |p|
        p.input :file, hint: p.template.image_tag(p.object.file.url(:default))
      end
    end

    f.buttons
  end
end
