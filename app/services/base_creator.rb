class BaseCreator
  method_object :attributes
  attr_implement :permitted_attributes
  attr_implement :scope

  def call
    scope.find_or_initialize_by(tmdb_id: attributes[:tmdb_id]).tap do |object|
      object.assign_attributes(attributes.slice(*permitted_attributes))
      object.save
    end
  end
end
