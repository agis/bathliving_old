module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                autolink: true,
                space_after_headers: true,
                no_styles: true
               )

    raw markdown.render(text)
  end

  def smart_truncate(s, opts = {})
    opts = { words: 10 }.merge(opts)
    a = s.split(/[ ]+/)
    n = opts[:words]
    a[0...n].join(' ') + (a.size > n ? '...' : '')
  end
end
