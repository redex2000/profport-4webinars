module CompetencesHelper
  def rails_to_bootstrap_type(type)
    case type
      when 'error'
        'alert-danger'
      when 'notice'
        'alert-info'
      else
        type
    end

  end

  def show_message(type, message)
    content_tag( :div,
                link_to("&times;".html_safe, '#', class: 'close', data: { dismiss: 'alert' }, aria: { label: 'close' }) +
                message,
                class: 'alert fade in '+rails_to_bootstrap_type(type) )
  end
end
