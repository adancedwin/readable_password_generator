# Readable password generator
Meant to generate readable for humans passwords.

Can be istalled as a gem:
```
gem install readable_password_generator
```

# How to use it

### 1. Generating a password without passing any length value 
By default length is in range of 10-18 chars.
Password intentionally **does not enclude uppercase letters** on perpose to be truly readable.

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
p result = my_pw.gener_passw # => "crankestin"
```
### 2. Generating a password by passing a length value

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new(12)
p result = my_pw.gener_passw # => "spychifrotru"
p result.length # => 12
```

### 3. Updating the length value of a generated password
```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
my_pw.set_length(12)
p len = my_pw.pw_length # => 12
```

### 4. If length value is not a correct Integer value
In this case it checks what data type was passed or Integer's length (if passed):
* NilClass - then generates a password with default length
* Anything but not Integer, Array NilClass - raises a certain ArgumentError
* Integer of >1 or 100< - raises a certain ArgumentError

