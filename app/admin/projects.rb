# encoding: utf-8

# TODO: translate

ActiveAdmin.register Project do
  menu priority: 2

  form multipart: true do |f|
    f.inputs "Εικόνες" do
      f.has_many :images do |p|
        p.input :file, hint: p.template.image_tag(p.object.file.url(:thumb))
      end
    end

    f.inputs "Πληροφορίες" do
      f.input :title
      f.input :description, as: :ckeditor, input_html: { height: 500 }
    end

    f.actions
  end
end
