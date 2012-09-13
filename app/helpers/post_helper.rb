module PostHelper
  def main_image(post, style = nil)
    if post.image?
      link_to post do
        image_tag post.image.url(style), class: "entry-image"
      end
    end
  end

  def publish_date(post)
    post.publish_date.to_formatted_s(:short)
  end
end