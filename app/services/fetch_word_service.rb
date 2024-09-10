
class FetchWordService
  # Fetches a word from the API and returns a WordOfTheDay object
  #
  # @return [WordDefinition]
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
