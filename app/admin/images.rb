ActiveAdmin.register Image do
  form do |f|
    f.inputs "Attachment", :multipart => true do
      f.input :file
    end

    f.buttons
  end
end
