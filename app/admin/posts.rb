# encoding: utf-8

ActiveAdmin.register Post do
  menu label: "Blog", priority: 3

  index do
    column :id
    column 'Τίτλος',               :title
    column 'Ημερ/νία δημοσίευσης', :publish_date
    column 'Δημιουργήθηκε στις',   :created_at
    column 'Ανανεώθηκε στις',      :updated_at
    default_actions
  end

  show do |post|
    attributes_table do
      row :id

      row :title

      row 'Βασικη εικονα' do
        image_tag(post.image.url(:thumb))
      end

      row 'Περιγραφη' do
        markdown(post.body)
      end

      row ' ' do
        link_to 'Προβολή στο site', post, target: "_blank"
      end

    end

    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs do
      f.input :image,        label: 'Εικόνα (680x234)', hint: image_tag(f.object.image.url(:thumb))
      f.input :title,        label: 'Τίτλος'
      f.input :publish_date, label: 'Ημερομηνία δημοσίευσης', as: :ui_date_picker
      f.input :body,         label: 'Κείμενο', hint: markdown_link
    end

    f.actions
  end

  controller do
    def update
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/posts', action: 'index'
      expire_action controller: '/posts', action: 'show'
      update!
    end

    def create
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/posts', action: 'index'
      expire_action controller: '/posts', action: 'show'
      create!
    end

    def destroy
      expire_action controller: '/main', action: 'home'
      expire_action controller: '/posts', action: 'index'
      expire_action controller: '/posts', action: 'show'
      destroy!
    end
  end
end
