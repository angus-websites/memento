require "httparty"
class WordService

  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  # Fetches a given words data from an API
  def fetch(word)
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    response = HTTParty.get(url)
    if response.success?
      response.body
    else
      raise "Error fetching data from API"
    end
  end

end
