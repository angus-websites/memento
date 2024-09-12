require "httparty"
class WordService

  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  def all_words
    @repository.all_words
  end

  # Fetch the current word of the day
  def get_word_of_today
    # Find the word of the day for today
    @repository.find_for_today
  end

  # Fetch a word by its ID
  def get_word_from_id(id)
    word = @repository.find_by_id(id)

    # Check the "used" field to see if the word has been used
    if word && !word.used
      word
    else
      nil
    end
  end

end
