class TMDB::Formatters::Movie
  pattr_initialize :movie_attrs

  def self.prepare(movie_attrs)
    new(movie_attrs).prepare
  end

  def prepare
    prepared_attrs = attrs.slice(:budget, :imdb_id, :overview, :popularity,
                                 :poster_path, :release_date, :revenue,
                                 :runtime, :tagline, :title, :vote_average,
                                 :vote_count)

    prepared_attrs.merge(tmdb_id: attrs[:id])
  end

  private

  def attrs
    @attrs ||= movie_attrs.deep_symbolize_keys
  end
end
