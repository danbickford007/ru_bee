# RuBee

Spellcheck for Ruby String.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ru_bee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ru_bee

## Usage

`#correct?`

######boolean

Does the string contain a misspelling?


`"This is a correct sentence. It works well and is pretty cool. You can also use numbers 123!".correct?`

##### `=> true`

`"This santence contains a typo.".correct?`

##### `=> false`


## Contributing

# Dictionaries
Add issue or submit pull request to add different languages or make additions to the library.
Each dictionary is in lib/dictionaries


