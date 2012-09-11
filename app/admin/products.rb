# encoding: utf-8

include ApplicationHelper

ActiveAdmin.register Product do
  menu label: 'Προϊόντα', priority: 1

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

      row 'Εικονα #1' do
        image_tag(product.images.first.file.url(:thumb))
      end

      row 'Περιγραφη' do
        markdown(product.description)
      end

      row :link do
        link_to product.link, product.link, target: "_blank"
      end
    end
    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs 'Εικόνες' do
      f.has_many :images do |p|
        p.input :file, label: 'Εικόνα', hint: p.template.image_tag(p.object.file.url(:thumb))
      end
    end

    f.inputs 'Πληροφορίες' do
      f.input :title,    label: 'Τίτλος', hint: 'Με μικρά και τόνους'
      f.input :category, label: 'Κατηγορία'
      f.input :link
      f.input :description, label: 'Περιγραφή',
                            hint: '<a href="http://daringfireball.net/projects/markdown/syntax" target="_blank">Οδηγίες σύνταξης</a>'.html_safe
    end

    f.actions
  end
end
