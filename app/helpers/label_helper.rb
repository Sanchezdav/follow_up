# frozen_string_literal: true

module LabelHelper
  def label_color(slug)
    case slug
    when /todo/ then 'bg-info'
    when /in-progress/ then 'bg-primary'
    when /qa/ then 'bg-warning'
    when /done/ then 'bg-success'
    else
      'bg-info'
    end
  end
end
