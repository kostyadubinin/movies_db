module ApplicationHelper
  def present(objects, presenter_class = nil)
    objects = Array.wrap(objects)
    return [] if objects.empty?
    klass = presenter_class || "#{objects.first.class}Presenter".constantize

    objects.map do |object|
      presenter = klass.new(object, self)
      yield(presenter) if block_given?
      presenter
    end
  end

  def responsive_columns_fix(index, columns_spec)
    tiers = columns_spec.map { |tier, width| index % width == 0 ? tier : nil }
    tiers = tiers.compact.map { |tier| "visible-#{tier}-block" }

    content_tag(:div, nil, class: "clearfix #{tiers.join(' ')}") if tiers.any?
  end
end
