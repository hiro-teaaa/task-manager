module TasksHelper
  # index-sort
  def sort_order(column, title, hash_param = {})
    # css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    params_generator(title, { sort: column, direction: direction }.merge(hash_param) )
  end

  def params_generator(title='', params)
    new_params = @prev_params.merge(params)
    link_to title, new_params.permit(:direction, :sort, :status)
  end
end
