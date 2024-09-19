class AddUniqueIndexToWords < ActiveRecord::Migration[7.2]
  def change
    add_index :word_of_days, :word, unique: true
  end
end
