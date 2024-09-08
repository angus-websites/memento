class WordsController < ApplicationController
  def show
    @word_of_the_day = "Memento"
    @definition = "Memento is a synonym of souvenir; it refers to something that is kept as a reminder of a person, place, or thing."
    @phonetic = "məˈmɛntoʊ"
    @example = "I kept the shell as a memento of my visit to the seashore."
  end
end
