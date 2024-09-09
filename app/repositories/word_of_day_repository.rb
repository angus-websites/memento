class WordOfDayRepository
  def create(word:, definition:, phonetic:, example:, date: Date.today)
    # Create a new WordOfDay record in the database
    WordOfDay.create!(
      word: word,
      definition: definition,
      phonetic: phonetic,
      example: example,
      date: date
    )
  end

  def find_by_date(date)
    WordOfDay.find_by(date: date)
  end

  def exists?(word)
    WordOfDay.exists?(word: word)
  end
end
