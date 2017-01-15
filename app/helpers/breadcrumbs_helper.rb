module BreadcrumbsHelper
  def head_breadcrumb(link_text)
    content_tag :li, link_text, class: 'breadcrumb-item active'
  end

  def link_breadcrumb(link_text, path)
    content_tag :li, link_to(link_text, path), class: 'breadcrumb-item'
  end
end
