class BaseCreator
  method_object :attributes
  attr_implement :permitted_attributes
  attr_implement :scope

  def call
    object = scope.find_or_initialize_by(tmdb_id: attributes[:tmdb_id])
    object.assign_attributes(attributes.slice(*permitted_attributes))
    object.save
    object
  end
end
