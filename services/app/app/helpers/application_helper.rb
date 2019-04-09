# frozen_string_literal: true

module ApplicationHelper
  def component(component_name, locals = {}, &block)
    name = component_name.split('_').first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  alias c component

  def user_photo(user)
    if user.photo.attached?
      url_for(user.photo)
    else
      'http://placehold.it/150x150'
    end
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-error'
    when 'alert' then 'alert alert-error'
    end
  end

  def han(model, attribute)
    model.human_attribute_name(attribute)
  end

  def han_state(record)
    record.aasm.human_state
  end
end
