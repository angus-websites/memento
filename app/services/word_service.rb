class WordService

  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  # Stores the word in the database if it doesn't already exist
  def store_word(word, definition, phonetic, example)
    @repository.create(
      word: word,
      definition: definition,
      phonetic: phonetic,
      example: example,
      date: Date.today
    )
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
    # WordDefinition.new(
    #   word: "Memento",
    #   definition: "Memento is a synonym of souvenir; it refers to something that is kept as a reminder of a person, place, or thing.",
    #   phonetic: "məˈmɛntoʊ",
    #   example: "I kept the shell as a memento of my visit to the seashore."
    # )
  end


end