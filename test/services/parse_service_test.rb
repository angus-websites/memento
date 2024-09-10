require "test_helper"

class ParseServiceTest < ActiveSupport::TestCase
  def setup
    @service = ParseService.new
  end

  test "parses the JSON string correctly" do
    json_string = '[{"word":"memento","phonetic":"/məˈmɛntoʊ/","phonetics":[{"text":"/məˈmɛntoʊ/","audio":"https://api.dictionaryapi.dev/media/pronunciations/en/memento-au.mp3","sourceUrl":"https://commons.wikimedia.org/w/index.php?curid=75833223","license":{"name":"BY-SA 4.0","url":"https://creativecommons.org/licenses/by-sa/4.0"}},{"text":"/məˈmɛntoʊ/","audio":"https://api.dictionaryapi.dev/media/pronunciations/en/memento-us.mp3","sourceUrl":"https://commons.wikimedia.org/w/index.php?curid=2776487","license":{"name":"BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"}}],"meanings":[{"partOfSpeech":"noun","definitions":[{"definition":"A keepsake; an object kept as a reminder of a place or event.","synonyms":[],"antonyms":[],"example":"I kept the shell as a memento of my visit to the seashore."}],"synonyms":["memorabilia","keepsake","souvenir"],"antonyms":[]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/memento"]}]'
    expected_result = {
      "word" => "memento",
      "phonetic" => "/məˈmɛntoʊ/",
      "example" => "I kept the shell as a memento of my visit to the seashore.",
      "definition" => "A keepsake; an object kept as a reminder of a place or event."
    }

    result = @service.parse_json(json_string)
    assert_equal expected_result, result
  end
end
