# encoding: utf-8

# TODO: translate

ActiveAdmin.register Post do
  menu label: "Άρθρα", priority: 3

  form do |f|
    f.inputs do
      f.input :title
      f.input :publish_date, as: :ui_date_picker
      f.input :content, as: :ckeditor, input_html: { height: 600 }
    end

    f.actions
  end
end
