# Readable password generator
Meant to generate readable for humans passwords.

Can be installed as a gem:
```
gem install readable_password_generator
```

# How to use it

### 1. Generating a password without passing any length value
By default length is 8 chars (if no Integer passed).
Password intentionally **does not include uppercase letters** on purpose to be truly readable.

```ruby
require_relative 'readable_password_generator'
pw = Password.new
p result = my_pw.generate # => "crankest"
```


### 2. Generating a password by passing a length value

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new
p result = my_pw.generate(12) # => "spychifrotru"
p result.length # => 12
```

You can pass a value as:
* an Integer
* an Array of Integers, an Integer will be picked randomly for every ".generate" call
* a Range of Integers, an Integer will be picked randomly for every ".generate" call

### 3. If length value is not a correct Integer value
In this case it checks what data type was passed or Integer's length (if passed):
* NilClass - then generates a password with default length
* Anything but not Integer, Array or NilClass - raises an Exception with a certain message
* Integer of >1 or 100< - raises an Exception with a certain message
