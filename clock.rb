# clock.rb
require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  # Select a word of the day at 12:00am every day
  every(1.day, 'word_of_day:select', at: '00:00') do
    system('bundle exec rake word_of_day:select')
  end
end
