# frozen_string_literal: true

module BootstrapHelper
  def nav_menu_item(path = '#')
    options = { class: "nav-link #{active_link_class(path)}" }
    content_tag :li, class: 'nav-item' do
      link_to path, options do
        yield if block_given?
      end
    end
  end

  def active_link_class(path)
    'active' if current_page?(path)
  end
end
