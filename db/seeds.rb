# encoding: utf-8

admin = YAML.load_file("#{Rails.root}/config/admin.yml")

AdminUser.create(
                email: admin['email'],
                password: admin['password'],
                password_confirmation: admin['password']
                )