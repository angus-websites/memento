class WordDefinition
  attr_reader :word, :definition, :phonetic, :example

  def initialize(word:, definition:, phonetic:, example:)
    @word = word
    @definition = definition
    @phonetic = phonetic
    @example = example
  end
end
