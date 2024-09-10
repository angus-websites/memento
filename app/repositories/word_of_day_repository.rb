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

  def load_default
    WordDefinition.new(
      word: "Memento",
      definition: "Memento is a synonym of souvenir; it refers to something that is kept as a reminder of a person, place, or thing.",
      phonetic: "məˈmɛntoʊ",
      example: "I kept the shell as a memento of my visit to the seashore."
    )
  end

  def find_by_date(date)
    WordOfDay.find_by(date: date)
  end

  def find_for_today
    find_by_date(Date.today)
  end

  def all_words
    WordOfDay.all
  end

  def find_most_recent
    # Find the most recent WordOfDay entry
    WordOfDay.order(date: :desc).first
  end

  def exists?(word)
    WordOfDay.exists?(word: word)
  end
end
