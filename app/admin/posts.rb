ActiveAdmin.register Post do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, :as => :ckeditor
      f.input :publish_date
    end

    f.buttons
  end

  # TODO: Improve views
  # OPTIMIZE: use jquery datepicker
end
