# Readable password generator
Meant to generate readable for humans passwords.

Can be installed as a gem:
```
gem install readable_password_generator
```

# How to use it

### 1. Generating a password without passing any length value
By default length is 8 chars (if nothing passed).
Password intentionally **does not include uppercase letters** on purpose to be truly readable.

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
p result = my_pw.generate # => "crankest"
```
### 2. Generating a password by passing a length value

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new(12)
p result = my_pw.generate # => "spychifrotru"
p result.length # => 12
```

### 3. If length value is not a correct Integer value
In this case it checks what data type was passed or Integer's length (if passed):
* NilClass - then generates a password with default length
* Anything but not Integer, Array NilClass - raises a certain ArgumentError
* Integer of >1 or 100< - raises a certain ArgumentError
