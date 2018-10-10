# Readable password generator
Meant to generate readable for humans passwords

Can be istalled as a gem:
```
gem install readable_password_generator
```

# How to use it

### Generating a password without passing any value 
By default length is in range of 10-18 chars

```ruby
require_relative 'readable_password_generator'
my_pw = Password.new()
p result = my_pw.gener_passw
```
