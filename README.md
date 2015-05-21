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

###correct?

```
#correct?
```

######boolean

Does the string contain a misspelling?

######arguments

```
#correct? language: 'english'
```

Other languages coming...


```ruby
"This is a correct sentence. It works well and is pretty cool. You can also use numbers 123!".correct?
```

##### `=> true`

```ruby
"This santence contains a typo.".correct?
```

##### `=> false`


##misspellings 

```
#misspellings
```

######Array

Array of misspellings from String

######arguments

```
#misspellings? language: 'english'
```

```ruby
"This is a correct sentence. It works well and is pretty cool. You can also use numbers 123!".misspellings
```

##### `=> []`

```ruby
"This santence contains a typo.".correct?
```

##### `=> ['santence']`


###suggestions

```
#misspellings(suggestions: true)
```

Returns array of hashes consisting of word and suggestions.

Ex:  `{word: 'fla', suggestions: ["acriflavin", "acriflavine"...]}`




## Contributing

#### Dictionaries
Add issue or submit pull request to add different languages or make additions to the library.
Each dictionary is in lib/dictionaries


