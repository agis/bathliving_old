# encoding: utf-8

# OPTIMIZE: Implement a check for attachment presence, begin/rescue is not a good solution

class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]
      height = options[:height]

      record.errors[attribute] << "To πλάτος πρέπει να είναι #{width}px" unless dimensions.width == width
      record.errors[attribute] << "Το ύψος πρέπει να είναι #{height}px" unless dimensions.height == height
    rescue
      # Attachment is not present, so do nothing
    end
  end
end