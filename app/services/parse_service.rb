class ParseService
  def parse_json(json_str)
    # Parse the file and return the result

    # Load json
    json = JSON.parse(json_str)

    # Extract the word
    word = json[0]["word"]

    # Extract the phonetic
    phonetic = json[0]["phonetic"]

    # Extract the example
    example = json[0]["meanings"][0]["definitions"][0]["example"]

    # Extract the definition
    definition = json[0]["meanings"][0]["definitions"][0]["definition"]

    # Return the result
    {
      "word" => word,
      "phonetic" => phonetic,
      "example" => example,
      "definition" => definition
    }
  end
end
