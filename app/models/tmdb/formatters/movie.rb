class TMDB::Formatters::Movie
  attr_private :attributes

  def self.prepare(*params)
    new(*params).prepare
  end

  def initialize(attributes)
    @attributes = attributes.deep_symbolize_keys
  end

  def prepare
    attrs = attributes.slice(
      :overview,
      :popularity,
      :poster_path,
      :release_date,
      :tagline,
      :title,
      :vote_average,
      :vote_count
    )

    attrs.merge(
      budget: budget,
      revenue: revenue,
      runtime: runtime,
      imdb_id: imdb_id,
      tmdb_id: tmdb_id
    )
  end

  def tmdb_id
    attributes[:id]
  end

  def budget
    zero_to_nil(attributes[:budget])
  end

  def revenue
    zero_to_nil(attributes[:revenue])
  end

  def runtime
    zero_to_nil(attributes[:runtime])
  end

  def imdb_id
    blank_to_nil(attributes[:imdb_id])
  end

  private

  def zero_to_nil(value)
    return if value.nil?
    value.zero? ? nil : value
  end

  def blank_to_nil(value)
    value.blank? ? nil : value
  end
end
