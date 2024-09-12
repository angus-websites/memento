class CreateWordOfDays < ActiveRecord::Migration[7.2]
  def change
    create_table :word_of_days do |t|
      t.string :word
      t.text :definition
      t.text :phonetic
      t.text :example
      t.date :date
      t.boolean :used, default: false
      t.timestamps
    end
  end
end
