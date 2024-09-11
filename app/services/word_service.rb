require "httparty"
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

  # Generate a random word of the day
  def generate_word_of_day

    url = "https://random-word-api.herokuapp.com/word"
    response = HTTParty.get(url)
    if response.success?
      parsed_response = JSON.parse(response.body)
      word = parsed_response[0]


      # Ensure the word doesn't already exist in the database
      #
      if @repository.exists?(word)

        # Run again
        generate_word_of_day
      else

        # Fetch the definition, phonetic, and example for the word
        json_data = fetch(word)

        # Parse the JSON data and store the word in the database
        parse_and_store(json_data)

      end
    else
      raise "Error fetching data from API"
    end

  end

  # Parses the JSON string and stores the word in the database
  def parse_and_store(json_data)
    # Create a parse service to handle the JSON data
    data = ParseService.new.parse_json(json_data)

    # Store the word in the database
    store_word(data["word"], data["definition"], data["phonetic"], data["example"])

  end

end
