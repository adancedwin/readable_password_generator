class Password

  VOWELS = %w(a e i o u y)
  CONSONANTS = %w(b c d f g h j k l m n p r s t v w x z)
  DOUBLE_CONSONANTS = %w(ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
  DEFAULT_LENGTH = 8

  attr_reader :length

  def initialize(arg_length = DEFAULT_LENGTH)
    @length = validate_length(arg_length)
    @vowel_position = 0
  end

  def generate
    @vowel_position = [1, 2].sample
    size, result = @length, ""
    count = 0
    size.times do |char|
      count = 0 if count==2
      count+=1
      result << take_char(count)
    end
    result = result[0...size]
  end

  private

  #take a sample char from a set of letters
  def take_char(set_type)
    if set_type == @vowel_position
      VOWELS.sample
    else
      #prioritize randomness to choosing CONSONANTS over DOUBLE_CONSONANTS (3:1)
      if [1,2,3,4].sample == 4
        CONSONANTS.sample
      else
        DOUBLE_CONSONANTS.sample
      end
    end
  end

  #checking length value - does it meet specified criteria:
  # - must consist of numeric value or numeric range
  def validate_length(arg_length)
    if arg_length.is_a?(NilClass)
      arg_length = DEFAULT_LENGTH
    elsif arg_length.is_a?(Array)
      arg_length = arg_length.sample
    elsif arg_length.is_a?(Integer)
      if (arg_length < 1) || (arg_length > 100)
        raise ArgumentError, "Length cannot be #{arg_length}, length must be in range of 1-100!"
      end
    else
      raise ArgumentError, "Length must be either an Integer or a Range value!\n#{arg_length.class} data type is given. "
    end
    arg_length
  end
end
