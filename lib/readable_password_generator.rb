class Password

  VOWELS = %w(a e i o u y)
  CONSONANTS = %w(b c d f g h j k l m n p r s t v w x z)
  DOUBLE_CONSONANTS = %w(ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
  DEFAULT_LENGTH = 8

  def generate(length = DEFAULT_LENGTH)
    length = validate_length(length)
    vowel_position = [1,2].sample
    size, password = length, ""
    char_set = 1
    size.times do |char|
      password << pick_letter(char_set.odd?, vowel_position)
      char_set+=1
    end
    password = password[0...size]
  end

  private

  def validate_length(length)
    if length.is_a?(NilClass)
      return DEFAULT_LENGTH
    elsif length.is_a?(Array)
      length = length.sample
    elsif length.is_a?(Range)
      length = rand(length)
    end
    if length.is_a?(Integer)
      if (length < 1) || (length > 100)
        raise Exception.new("Length cannot be #{length}, length must be in range of 1-100!")
      end
    else
      raise Exception.new("Length must be either an Integer or an Array or a Range value!\n#{length.class} data type is given.")
    end
    length
  end

  def pick_letter(char_set, vowel_position)
    if char_set == vowel_position.odd?
      VOWELS.sample
    else
      rand(1..4) == 4 ? DOUBLE_CONSONANTS.sample : CONSONANTS.sample
    end
  end
end
