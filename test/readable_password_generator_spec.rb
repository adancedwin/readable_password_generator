require_relative '../lib/readable_password_generator'

describe Password do
  context "Testing with valid input" do
    it "A generated password, when nothing passed, should be with 8 chars length" do
      password = Password.new
      outcome = password.generate
      expect(outcome.length).to eql 8
    end

    it "A generated password, when 12 Integer passed, should be with 12 chars length" do
      password = Password.new
      outcome = password.generate(12)
      expect(outcome.length).to eql 12
    end

    it "A generated password, when 1 Integer passed, should be with 1 chars length" do
      password = Password.new
      outcome = password.generate(1)
      expect(outcome.length).to eql 1
    end

    it "A generated password, when 100 Integer passed, should be with 100 chars length" do
      password = Password.new
      outcome = password.generate(100)
      expect(outcome.length).to eql 100
    end

    it "A generated password should include vowels" do
      password = Password.new
      outcome = password.generate(100)
      expect(outcome).to match(/[aeiouy]/)
    end

    it "A generated password should include consonants" do
      password = Password.new
      outcome = password.generate(100)
      expect(outcome).to match(/[bcdfghjklmnprstvwxz]/)
    end
  end
end
