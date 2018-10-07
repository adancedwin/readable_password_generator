# Readable password generator
Meant to generate readable for humans passwords

Can be istalled as a gem:
```
gem install readable_password_generator
```

# How to use it

### Generating a password without passing any length value 
By default length is in range of 10-18 chars.
Password intentionally **does not enclude uppercase letters** on perpose to be truly readable.

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
p result = my_pw.gener_passw # => "crankestin"
```
### Generating a password by passing a length value

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new(12)
p result = my_pw.gener_passw # => "spychifrotru"
p result.length # => 12
```

### Updating the length value of a generated password
```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
my_pw.pw_length(12)
p my_pw.gener_passw.length # => 12
```

### If length value is not a correct Integer value
In this case it checks what data type was passed and Integer's length (if passed):
* NilClass - then generates a password with [default length](https://github.com/adancedwin/readable_password_generator#generating-a-password-without-passing-any-value)
* Anything but not Integer, Array NilClass - raises a certain ArgumentError
* Integer of >1 or 100< - raises a certain ArgumentError

