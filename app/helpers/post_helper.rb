module PostHelper
  def main_image(post)
    if post.image?
      link_to post do
        image_tag post.image.url, class: "entry-image"
      end
    end
  end
end