class Suggestion < ApplicationRecord
  validates :word, presence: true
end
