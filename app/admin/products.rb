# encoding: utf-8

ActiveAdmin.register Product do
  menu label: "Προϊόντα"

  form multipart: true do |f|
    f.inputs "Images" do
      f.has_many :images do |p|
        p.input :file, hint: p.template.image_tag(p.object.file.url(:default))
      end
    end

    f.inputs "Information" do
      f.input :title
      f.input :description, as: :ckeditor, input_html: { height: 500, width: 800 }
    end

    f.actions
  end
end
