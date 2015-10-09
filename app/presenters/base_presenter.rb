class BasePresenter < SimpleDelegator
  attr_private :object, :view
  alias_method :h, :view

  def initialize(object, view)
    @object, @view = object, view
    super(@object)
  end
end
