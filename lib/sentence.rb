require "sentence/version"

module Sentence
  class SentenceError < StandardError; end
  class InvalidString < SentenceError; end

  def self.reverse(sentence)
    # raise exception if provided a non-string
    raise InvalidString if !sentence.is_a?(String)

    # strip leading and trailing whitespace from sentence
    sentence = sentence.strip

    # raise exception if empty string
    raise InvalidString if sentence.empty?

    # split words into array (regex pattern: any whitespace character)
    words = sentence.split(/\s+/)

    # reverse order of array and join words using " "
    words.reverse.join(" ")
  end
end
