ActiveAdmin.register Post do
  form do |f|
    f.inputs do
      f.input :title
      f.input :publish_date, :as => :ui_date_picker
      f.input :content, :as => :ckeditor, :input_html => { :height => 600 }
    end

    f.buttons
  end

  # TODO: Improve views
end
