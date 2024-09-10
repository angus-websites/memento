
# Clear existing data
WordOfDay.delete_all


WordOfDay.create!(
  word: "Turtle",
  definition: "Any land or marine reptile of the order Testudines, characterised by a protective shell enclosing its body. See also tortoise",
  phonetic: "tɜːtəl",
  example: "Thousands of turtles emerged from the waves and crawled across the sand on unsteady flippers.",
  date: Date.today - 4.days
)

WordOfDay.create!(
  word: "Homer",
  definition: "home run : a point scored in baseball when you hit the ball, usually out of the playing field, and are able to run around all the bases at one time to the starting base.",
  phonetic: "hoʊ.mɚ",
  example: "He went out and hit two homers.",
  date: Date.today - 3.days
)

WordOfDay.create!(
  word: "Hallucinate",
  definition: "to seem to see, hear, feel, or smell something that does not exist, usually because of a health condition or because you have taken a drug",
  phonetic: "həˈluː.sɪ.neɪt",
  example: "He began hallucinating and hearing voices",
  date: Date.today - 2.days
)

WordOfDay.create!(
  word: "Plushie",
  definition: "a toy made from cloth and filled with a soft material so that it is pleasant to hold, often in the form of an animal",
  phonetic: "plʌʃ.i",
  example: "The little girl was carrying a giraffe plushie",
  date: Date.today - 1.days
)

WordOfDay.create!(
  word: "Memento",
  definition: "Memento is a synonym of souvenir; it refers to something that is kept as a reminder of a person, place, or thing.",
  phonetic: "məˈmɛntoʊ",
  example: "I kept the shell as a memento of my visit to the seashore.",
  date: Date.today
)
