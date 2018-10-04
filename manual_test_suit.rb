#1. Compare the info on the default length and the length of a generated password
require_relative 'readable_password_generator'
my_pw = Password.new()
p my_pw #info on the default length set
result = my_pw.gener_passw
p result.length

#2 Updating the length value of a generated password
require_relative 'readable_password_generator'
my_pw = Password.new()
my_pw.pw_length = 10
result = my_pw.gener_passw
p result.length

#3. Checking that length value is passed and applied correctly
require_relative 'readable_password_generator'
my_pw = Password.new(11)
result = my_pw.gener_passw
p result.length

#4. Look at structure of a password:
# - no vowel come right after another vowel
# - there is no three consonants in a sequence
# - double-consonants (like sh) are not in greater quantity over regular consonants
require_relative 'readable_password_generator'
my_pw = Password.new(11)
p result = my_pw.gener_passw

#5. Passing Nilclass value and seeing that class does not end up
#with error and replaces it with default length value
require_relative 'readable_password_generator'
my_pw = Password.new(nil)
result = my_pw.gener_passw

#6. Passing String data type, should end up with a custom error
require_relative 'readable_password_generator'
my_pw = Password.new("Hi")

#7. Passing int values outside of range 1-100
require_relative 'readable_password_generator'
my_pw = Password.new(0)
my_pw = Password.new(101)
