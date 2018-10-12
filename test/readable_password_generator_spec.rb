require_relative '../lib/readable_password_generator'

describe Password do
  context "Testing with valid input" do
    it "A generated password, when nothing is passed, should be with 8 chars length" do
      password = Password.new
      outcome = password.generate
      expect(outcome.length).to eql 8
    end

    it "A generated password, when 12 Integer is passed, should be with 12 chars length" do
      password = Password.new
      outcome = password.generate(12)
      expect(outcome.length).to eql 12
    end

    it "A generated password, when 1 Integer is passed, should be with 1 chars length" do
      password = Password.new
      outcome = password.generate(1)
      expect(outcome.length).to eql 1
    end

    it "A generated password, when 100 Integer is passed, should be with 100 chars length" do
      password = Password.new
      outcome = password.generate(100)
      expect(outcome.length).to eql 100
    end

    it "A generated password should include vowels" do
      password = Password.new
      outcome = password.generate
      expect(outcome).to match(/[aeiouy]/)
    end

    it "A generated password should include consonants" do
      password = Password.new
      outcome = password.generate
      expect(outcome).to match(/[bcdfghjklmnprstvwxz]/)
    end

    it "A generated password should be with length from one of the Integers in the Array" do
      password = Password.new
      array = [20, 11, 17]
      outcome = password.generate(array)
      expect(array.include?(outcome.length)).to be true
    end

    it "A generated password should be with length from one of the Integers in the Range" do
      password = Password.new
      range = (8..20)
      outcome = password.generate(range)
      expect(range.include?(outcome.length)).to be true
    end
  end

  context "Testing with invalid input" do
    it "A generated password, when NilClass value is passed, should be with 8 chars length" do
      password = Password.new
      outcome = password.generate(nil)
      expect(outcome.length).to eql 8
    end

    it "When 0 Integer is passed Exception of invalid range values should be returned" do
      password = Password.new
      invalid_length = 0
      expect {outcome = password.generate(invalid_length)}.to raise_exception(Exception, "Length cannot be #{invalid_length}, length must be in range of 1-100!")
    end

    it "When 101 Integer is passed Exception of invalid range values should be returned" do
      password = Password.new
      invalid_length = 101
      expect {outcome = password.generate(invalid_length)}.to raise_exception(Exception, "Length cannot be #{invalid_length}, length must be in range of 1-100!")
    end
  end
end
