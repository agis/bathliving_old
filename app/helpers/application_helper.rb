module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                autolink: true,
                space_after_headers: true,
                no_styles: true
               )

    raw markdown.render(text)
  end
end
