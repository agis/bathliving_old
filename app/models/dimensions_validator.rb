# encoding: utf-8

class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.send("#{attribute}?".to_sym)
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]
      height = options[:height]

      record.errors[attribute] << "Width must be #{width}px" unless dimensions.width == width
      record.errors[attribute] << "Height must be #{height}px" unless dimensions.height == height
    end
  end
end








  # def validate_each(record, attribute, value)
  #     attribute = "#{attribute}_content_type".to_sym
  #     value = record.send(:read_attribute_for_validation, attribute)
  #     allowed_types = [options[:content_type]].flatten

  #     return if (value.nil? && options[:allow_nil]) || (value.blank? && options[:allow_blank])

  #     if allowed_types.none? { |type| type === value }
  #       record.errors.add(attribute, :invalid, options.merge(
  #         :types => allowed_types.join(', ')
  #       ))
  #     end
  #   end
  # end