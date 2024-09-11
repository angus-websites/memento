
require_relative "../repositories/word_of_day_repository"

class WordsController < ApplicationController

  def index
    # Show all the past words of the day
    @words = WordOfDayRepository.new.all_words
  end

  def show
    # Find the word by its ID (params[:id] is automatically populated by Rails from the URL)
    word_of_day = WordOfDayRepository.new.find_by_id(params[:id])

    if word_of_day
      @word_of_the_day = word_of_day.word
      @definition = word_of_day.definition
      @phonetic = word_of_day.phonetic
      @example = word_of_day.example
      @date = word_of_day.formatted_date
    else
      render "errors/no_word"
    end
  end

  def test
    # Generate a random word of the day
    WordService.new.generate_word_of_day
    redirect_to root_path
  end

  # Show the current word of the day
  def day

    word_of_day = WordOfDayRepository.new.find_most_recent
    puts "most recent word 2: #{word_of_day.word}"
    if word_of_day
      @word_of_the_day = word_of_day.word
      @definition = word_of_day.definition
      @phonetic = word_of_day.phonetic
      @example = word_of_day.example
      @date = word_of_day.formatted_date
    else
      render "errors/no_word"
    end
  end
end
