class TMDB::Formatters::Movie
  def self.prepare(attrs)
    new(attrs).prepare
  end

  def initialize(attrs)
    @attrs = attrs.deep_symbolize_keys
  end

  def prepare
    prepared_attrs = attrs.slice(:budget, :imdb_id, :overview, :popularity,
                                 :poster_path, :release_date, :revenue,
                                 :runtime, :tagline, :title, :vote_average,
                                 :vote_count)

    prepared_attrs.merge(tmdb_id: attrs[:id])
  end

  private

  attr_reader :attrs
end
