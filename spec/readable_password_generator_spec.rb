require_relative '../lib/readable_password_generator'

describe Password do
  context "Testing with valid input to generate a password" do
    it "Should be of 8 chars length if nothing is passed" do
      password = Password.new
      outcome = password.generate
      expect(outcome.length).to eql 8
    end

    it "Should be of 12 chars length if 12 (Integer) was passed" do
      password = Password.new
      outcome = password.generate(12)
      expect(outcome.length).to eql 12
    end

    it "Should be of 1 char length if 1 (Integer) was passed" do
      password = Password.new
      outcome = password.generate(1)
      expect(outcome.length).to eql 1
    end

    it "Should be of 100 chars length if 100 (Integer) was passed" do
      password = Password.new
      outcome = password.generate(100)
      expect(outcome.length).to eql 100
    end

    it "Should include vowels" do
      password = Password.new
      outcome = password.generate
      expect(outcome).to match(/[aeiouy]/)
    end

    it "Should include consonants" do
      password = Password.new
      outcome = password.generate
      expect(outcome).to match(/[bcdfghjklmnprstvwxz]/)
    end

    it "Should be of a length from one of the Integers in the passed Array" do
      password = Password.new
      array = [20, 11, 17]
      outcome = password.generate(array)
      expect(array.include?(outcome.length)).to be true
    end

    it "Should be of a length from one of the Integers in the passed Range" do
      password = Password.new
      range = (8..20)
      outcome = password.generate(range)
      expect(range.include?(outcome.length)).to be true
    end
  end


  context "Testing with invalid input in an attempt to generate a password" do
    it "Should be of 8 chars length when NilClass value was passed, " do
      password = Password.new
      outcome = password.generate(nil)
      expect(outcome.length).to eql 8
    end

    it "Should return the Exception of invalid range values if 0 (Integer) was passed" do
      password = Password.new
      invalid_length = 0
      expect {outcome = password.generate(invalid_length)}.to raise_exception(Exception, "Length cannot be #{invalid_length}, length must be in range of 1-100!")
    end

    it "Should return the Exception of invalid range values if 101 (Integer) was passed" do
      password = Password.new
      invalid_length = 101
      expect {outcome = password.generate(invalid_length)}.to raise_exception(Exception, "Length cannot be #{invalid_length}, length must be in range of 1-100!")
    end

    it "Should return the Exception of invalid data type if String value was passed" do
      password = Password.new
      invalid_length = "str"
      expect {outcome = password.generate(invalid_length)}.to raise_exception(Exception, "Length must be either an Integer or an Array or a Range value!\n#{invalid_length.class} data type is given.")
    end
  end
end
