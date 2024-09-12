namespace :word_of_day do
  desc "Select the next word of the day"
  task select: :environment do
    count = WordOfDay.where(used: false).count
    if count > 0

      # Generate a random offset to select a random word
      offset = rand(count)
      word = WordOfDay.where(used: false).offset(offset).first

      if word
        word.update(date: Date.today, used: true)
        puts "Selected word of the day: #{word.word}"
      else
        puts "No unused words available"
        exit(1)
      end
    else
      puts "No unused words available"
      exit(1)
    end
  end
end
