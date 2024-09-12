class WordService

  def initialize(repository = WordOfDayRepository.new)
    @repository = repository
  end

  # The past 50 words that have been used
  def past_words
    @repository.all_words.where(used: true).order(date: :desc).limit(50)
  end

  # Fetch the current word of the day
  def get_word_of_today
    # Find the word of the day for today
    @repository.find_for_today
  end

  # Fetch a word by its ID
  def get_word_from_id(id)
    word = @repository.find_by_id(id)
    # Check the "used" field is true
    if word&.used
      word
    else
      nil
    end
  end

end
