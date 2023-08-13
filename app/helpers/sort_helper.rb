module SortHelper
  def sort_link(label, column, params)
    link_to label, wfiles_path(sort: { column: column, direction: next_direction(column, params) }), class: 'sortable'
  end

  def sort_class(column, params)
    next_direction(column, params)
  end

  def next_direction(column, params)
    return '' if params.nil?
    return '' unless column == params['column']

    case params['direction']
    when ''
      'asc'
    when 'asc'
      'desc'
    when 'desc'
      ''
    end
  end
end
