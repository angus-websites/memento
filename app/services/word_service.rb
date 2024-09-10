class WordService

  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  # Stores the word in the database if it doesn't already exist
  def store_word(word_of_the_day: WordDefinition)
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

  # Fetches a random word from an API
  def fetch
    # response = YourApiClient.get_random_word
    #
    # WordDefinition.new(
    #   word: response.word,
    #   definition: response.definition,
    #   phonetic: response.phonetic,
    #   example: response.example
    # )
    WordDefinition.new(
      word: "Memento",
      definition: "Memento is a synonym of souvenir; it refers to something that is kept as a reminder of a person, place, or thing.",
      phonetic: "məˈmɛntoʊ",
      example: "I kept the shell as a memento of my visit to the seashore."
    )
  end


end