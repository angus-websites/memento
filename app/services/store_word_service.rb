class StoreWordService
  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  # Stores the word in the database if it doesn't already exist
  #
  # @param word_of_the_day [WordDefinition]
  def create_word(word_of_the_day: WordDefinition)
    unless @repository.exists?(word_of_the_day.word)
      @repository.create(
        word: word_of_the_day.word,
        definition: word_of_the_day.definition,
        phonetic: word_of_the_day.phonetic,
        example: word_of_the_day.example,
        date: Date.today
      )
    end
  end
end
