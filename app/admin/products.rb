# encoding: utf-8

# TODO: translate

ActiveAdmin.register Product do
  menu label: "Προϊόντα", priority: 1

  index do
    column :id
    column :title
    column :created_at
    column :updated_at
    default_actions
  end

  show do |product|
    attributes_table do
      row :title

      row "First image" do
        image_tag(product.images.first.file.url(:thumb))
      end

      row :description do
        raw(product.description)
      end

      row :link do
        link_to product.link, product.link, target: "_blank"
      end
    end
    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs "Εικόνες" do
      f.has_many :images do |p|
        p.input :file, hint: p.template.image_tag(p.object.file.url(:thumb))
      end
    end

    f.inputs "Πληροφορίες" do
      f.input :title
      f.input :category
      f.input :link
      f.input :description
    end

    f.actions
  end
end
