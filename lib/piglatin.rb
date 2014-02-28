class PigLatin < String
  attr_accessor :phrase

  VOWELS = 'aeiou'

  def initialize(base_string='')
    @phrase = base_string
    super base_string
  end

  alias :phrase= :initialize

  def translate
    @phrase.gsub(/\w+/) do |word|
      translate_word word
    end
  end

  private

  def translate_word(word)
    is_capitalized = word.downcase!

    begining_consonant = word.slice!(/^[^#{VOWELS}]*/)
    word << begining_consonant

    case word
    when /[#{VOWELS}]$/
      word.gsub!(/$/, "yay")
    when /y$/
      word.gsub!(/$/, "nay")
    else
      word.gsub!(/$/, "ay")
    end

    word.capitalize! if is_capitalized

    return word
  end
end
