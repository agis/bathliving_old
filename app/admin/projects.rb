# encoding: utf-8

# TODO: Show all images in #show

include ApplicationHelper

ActiveAdmin.register Project do
  menu priority: 2

  index do
    column :id
    column 'Τίτλος',              :title
    column 'Δημιουργήθηκε στις',  :created_at
    column 'Ανανεώθηκε στις',     :updated_at
    default_actions
  end

  show do |project|
    attributes_table do
      row :id

      row :title

      row :subtitle

      row 'Βασικη εικονα' do
        image_tag(project.images.first.file.url(:thumb))
      end

      row 'Εικoνα Slideshow' do
        image_tag(project.slide_image.url(:thumb))
      end

      row 'Περιγραφη' do
        markdown(project.description)
      end

      row ' ' do
        link_to 'Προβολή στο site', project, target: "_blank"
      end
    end

    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs "Εικόνες" do
      f.has_many :images do |p|
        p.input :file, label: 'Εικόνα 680x540', hint: p.template.image_tag(p.object.file.url(:thumb))
      end
    end

    f.inputs "Εικόνα Slideshow (αρχική)" do
      f.input :slide_image, label: 'Εικόνα 940x380', hint: image_tag(f.object.slide_image.url(:thumb))
    end

    f.inputs "Πληροφορίες" do
      f.input :title,       label: 'Τίτλος',    hint: 'π.χ. Απαλές Αποχρώσεις'
      f.input :subtitle,    label: 'Υπότιτλος', hint: 'π.χ. Κατοικία στη Σάμο'
      f.input :description, label: 'Περιγραφή',
                            hint:   markdown_link
    end

    f.actions
  end

  controller do
    def update
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/projects', action: 'index'
      expire_action controller: '/projects', action: 'show'
      update!
    end

    def create
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/projects', action: 'index'
      create!
    end

    def destroy
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/projects', action: 'index'
      expire_action controller: '/projects', action: 'show'
      destroy!
    end
  end
end
