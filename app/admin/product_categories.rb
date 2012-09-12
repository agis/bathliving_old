# encoding: utf-8

ActiveAdmin.register ProductCategory do
  menu parent: "Κατηγορίες", label: 'Προϊόντων'

  index do
    column :id
    column 'Τίτλος',              :title
    column 'Δημιουργήθηκε στις',  :created_at
    column 'Ανανεώθηκε στις',     :updated_at
    default_actions
  end

end
