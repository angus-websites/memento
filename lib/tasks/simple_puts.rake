# Simple puts task

namespace :simple_puts do
  desc "Simple puts task"
  task select: :environment do
    puts "Simple puts task"
  end
end
