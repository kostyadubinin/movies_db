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
end
