module Sortabl
  extend ActiveSupport::Concern

  included do
    before_action :set_sort_params
  end

  def set_sorter
    unless @sort_param.empty?
      ap @sort_param
      ap session["#{@resource.to_s.underscore}_sort"]
      ap @sort_param.dig(:sort, :column) == session.dig("#{@resource.to_s.underscore}_sort", 'column')
      if @sort_param.dig(:sort, :column) == session.dig("#{@resource.to_s.underscore}_sort", 'column')
      direction = case session.dig("#{@resource.to_s.underscore}_sort", 'direction')
                  when nil
                    'asc'
                  when 'asc'
                    'desc'
                  when 'desc'
                    nil
                  end
      else
        direction = nil
      end
      ap direction
      ap @sort_param[:sort].merge({ direction: direction })
      session["#{@resource.to_s.underscore}_sort"] = @sort_param[:sort].merge({ direction: direction })
    end
    # ap "session.dig: #{session.dig("#{Wfile.to_s.underscore}_filters", 'column')}"
    #if column == session.dig("#{resource.to_s.underscore}_filters", 'column')
    #  puts session.dig("#{resource.to_s.underscore}_filters", 'direction')
    #  case session.dig("#{resource.to_s.underscore}_filters", 'direction')
    #  when nil
    #    'asc'
    #  when 'asc'
    #    'desc'
    #  end
    # end
    session["#{Wfile.to_s.underscore}_filters"] = params.permit(:column, :direction)
  end


  def set_sort_params
    @sort_param = params.permit(sort: {})
  end
end
