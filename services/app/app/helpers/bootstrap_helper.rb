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

  def sidebar_menu_item(path = '#')
    options = {
      class: "list-group-item list-group-item-action #{bg_link_class(path)} #{active_link_class(path)}"
    }

    link_to path, options do
      yield if block_given?
    end
  end

  def active_link_class(path)
    'active' if active?(path)
  end

  def bg_link_class(path)
    'bg-light' unless active?(path)
  end

  def active?(path)
    current_page?(path)
  end
end
