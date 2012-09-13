# encoding: utf-8

class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.send("#{attribute}?".to_sym)
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]
      height = options[:height]

      record.errors[attribute] << "To πλάτος πρέπει να είναι #{width}px" unless dimensions.width == width
      record.errors[attribute] << "Το ύψος πρέπει να είναι #{height}px" unless dimensions.height == height
    end
  end
end