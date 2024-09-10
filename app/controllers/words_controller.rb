
require_relative "../repositories/word_of_day_repository"

class WordsController < ApplicationController

  def index
    # Show all the past words of the day
    @words = WordOfDayRepository.new.all_words
  end

  def show
    # Find the word by its ID (params[:id] is automatically populated by Rails from the URL)
    word_of_day = WordOfDay.find(params[:id])

    # Assign the word's attributes to instance variables for the view
    @word_of_the_day = word_of_day.word
    @definition = word_of_day.definition
    @phonetic = word_of_day.phonetic
    @example = word_of_day.example
    @date = word_of_day.formatted_date
  end

  def day

    # Show the current word of the day

    word_of_day = WordOfDayRepository.new.find_most_recent

    @word_of_the_day = word_of_day.word
    @definition = word_of_day.definition
    @phonetic = word_of_day.phonetic
    @example = word_of_day.example
    @date = word_of_day.formatted_date
  end
end
