
require_relative "../repositories/word_of_day_repository"

class WordsController < ApplicationController
  def show

    # Use the repository to get the word of the day

    word_of_day = WordOfDayRepository.new.find_most_recent

    @word_of_the_day = word_of_day.word
    @definition = word_of_day.definition
    @phonetic = word_of_day.phonetic
    @example = word_of_day.example
  end
end
