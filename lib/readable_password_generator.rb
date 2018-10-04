class Password

  #minimum default length is set to 10 by security concerns of a readable password
  DEFAULT_PW_LENGTH = [10,11,12,13,14,15,16,17,18]

  attr_accessor :pw_length

  def initialize(a_pw_length = DEFAULT_PW_LENGTH.sample)
    @pw_length = check_length_value(a_pw_length) #checking on password length value
    @vowel_pos = 0 # by default start password with a vowel
  end

  #generate password of a required length
  def gener_passw
    #set position for a vowel: either to start a password with it first or not:
    # 0 - start password with a vowel
    # 1 - start password with a consonat(s)
    @vowel_pos = [1, 2].sample
    size, result = @pw_length, ""
    count = 0
    size.times do |char|
      count = 0 if count==2
      count+=1
      result << take_char(count)
    end
    return result = result[0...size]
  end

  private

  #sets of character used in generating
  VOWELS = %w(a e i o u y)
  CONSONANTS = %w(b c d f g h j k l m n p r s t v w x z)
  #to diversify the end result
  DOUBLE_CONSONANTS = %w(ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)

  #take a sample char from a set of letters
  def take_char(set_type)
    if set_type == @vowel_pos
      return VOWELS.sample
    else
      #prioritize randomness to choosing CONSONANTS over DOUBLE_CONSONANTS (3:1)
      if [1,2,3,4].sample == 4
        return CONSONANTS.sample
      else
        return DOUBLE_CONSONANTS.sample
      end
    end
  end

  #checking length value - does it meet specified criteria:
  # - must consist of numeric value or numeric range
  def check_length_value(a_pw_length)
    if a_pw_length.is_a?(NilClass)
      a_pw_length = DEFAULT_PW_LENGTH.sample
    elsif a_pw_length.is_a?(Array)
      a_pw_length = a_pw_length.sample
    elsif a_pw_length.is_a?(Integer)
      if (a_pw_length < 1) || (a_pw_length > 100)
        raise ArgumentError, "Length cannot be #{a_pw_length}, length must be in range of 1-100!"
      end
    else
      raise ArgumentError, "Length must be either an Integer or a Range value!\n#{a_pw_length.class} data type is given. "
    end
    return a_pw_length
  end
end
