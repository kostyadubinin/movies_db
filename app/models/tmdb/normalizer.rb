class TMDB::Normalizer
  attr_private :attributes, :zero_to_nil

  def self.call(*params)
    new(*params).call
  end

  def initialize(attributes, zero_to_nil: [])
    @attributes = attributes.deep_symbolize_keys
    @zero_to_nil = Array.wrap(zero_to_nil)
  end

  def call
    nilify_empty_strings(attributes)
      .tap { |attributes| attributes.merge!(nilified_zeros) }
      .tap { |attributes| attributes[:tmdb_id] = attributes.delete(:id) }
  end

  private

  def nilified_zeros
    nilify_zeros(attributes.slice(*zero_to_nil))
  end

  def nilify_empty_strings(attributes)
    attributes.each do |k, v|
      attributes[k] = nil if v.is_a?(String) && v.empty?
    end
  end

  def nilify_zeros(attributes)
    attributes.each do |k, v|
      attributes[k] = nil if v.respond_to?(:zero?) && v.zero?
    end
  end
end
