# config/schedule.rb
set :output, "log/cron.log"

# Select a word of the day
every :day, at: "12:00am" do
  rake "word_of_day:select"
end
