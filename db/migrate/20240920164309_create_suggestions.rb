class CreateSuggestions < ActiveRecord::Migration[7.2]
  def change
    create_table :suggestions do |t|
      t.string :word
      t.text :definition
      t.string :phonetic
      t.text :example

      t.timestamps
    end
  end
end
