
class FetchWordService
  # Fetches a word from the API and returns a WordOfTheDay object
  #
  # @return [WordOfTheDay]
  def fetch
    response = YourApiClient.get_random_word

    WordOfTheDay.new(
      word: response.word,
      definition: response.definition,
      phonetic: response.phonetic,
      example: response.example
    )
  end
end
