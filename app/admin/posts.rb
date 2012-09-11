# encoding: utf-8

ActiveAdmin.register Post do
  menu label: "Άρθρα", priority: 3

  form do |f|
    f.inputs do
      f.input :title,        label: 'Τίτλος'
      f.input :publish_date, label: 'Ημερομηνία δημοσίευσης', as: :ui_date_picker
      f.input :body,         label: 'Κείμενο', hint: markdown_link
      # f.input :body, as: :ckeditor, input_html: { height: 600 }
    end

    f.actions
  end
end
