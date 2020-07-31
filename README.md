# RuBee

Spell check for Ruby String.


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

### correct?

```
#correct?
```

###### boolean

Checks String for misspelled words. Returns boolean.

###### arguments

```
#correct? language: 'english'
```

_Other languages coming..._

###### usage

```ruby
"This is a correct sentence. It works well and is pretty cool. You can also use numbers 123!".correct?
```

###### `=> true`

```ruby
"This santence contains a typo.".correct?
```

###### `=> false`


### spell_check

```
#spell_check
```

###### array

```
#spell_check language: 'english'
```

Returns array of hashes consisting of word and suggestioned corrections.

###### usage

```ruby
'fla'.spell_check 
```

###### `=> [{word: 'fla', suggestions: ["flab", "flabbergast", "flabbergastation", "flabbergasted"...]}]`


### misspellings 

```
#misspellings
```

###### array

Array of misspellings from String

```ruby
"This is a correct sentence. It works well and is pretty cool. You can also use numbers 123!".misspellings
```

###### `=> []`

```ruby
"This santence contains a typo.".misspellings
```

###### `=> ['santence']`


## Contributing

#### Code
fork or pr away

#### Dictionaries
Add issue or submit pull request to add different languages or make additions to the library.
Each dictionary is in lib/dictionaries


