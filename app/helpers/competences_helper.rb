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

  # Взято по примеру с http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true
  # Возвращает ссылку, содержащую нужные параметры для пагинации и сортировки, а также правильное направление сортировки
  # Направление сортировки меняется на убывание, если было по возрастанию и кликнули на тот же столбец
  # @param column - столбец из модели, по которому сортируем
  # @param title - Наименование, которое выводим в заголовке таблице, которое кликабельно
  # TODO: Добавить класс для красивого отображения
  # TODO: Сделать по AJAX
  # Разобраться с вопросами безопасности, пока сделано permit!
  def sortable(column, title = nil)
    title ||= column
    direction = ( column == sort_param && direction_param == 'asc' )? 'desc' : 'asc'
    link_to title, safe_params.merge( sort: column, direction: direction, page: nil )
  end
end
