if Rails.env == 'production'
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_credentials] = YAML.load_file("#{Rails.root}/config/s3.yml")
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'
end