# encoding: utf-8

include ApplicationHelper

ActiveAdmin.register Project do
  menu priority: 2

  form multipart: true do |f|
    f.inputs "Εικόνες" do
      f.has_many :images do |p|
        p.input :file, label: 'Εικόνα', hint: p.template.image_tag(p.object.file.url(:thumb))
      end
    end

    f.inputs "Πληροφορίες" do
      f.input :title,       label: 'Τίτλος',    hint: 'Με μικρά και τόνους'
      f.input :description, label: 'Περιγραφή',
                            hint:   markdown_link
    end

    f.actions
  end
end
