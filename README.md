[![Stories in Ready](https://badge.waffle.io/mumuki/mumukit-auth.png?label=ready&title=Ready)](https://waffle.io/mumuki/mumukit-auth)
[![Build Status](https://travis-ci.org/mumuki/mumukit-auth.svg?branch=master)](https://travis-ci.org/mumuki/mumukit-auth)
[![Code Climate](https://codeclimate.com/github/mumuki/mumukit-auth/badges/gpa.svg)](https://codeclimate.com/github/mumuki/mumukit-auth)
[![Test Coverage](https://codeclimate.com/github/mumuki/mumukit-auth/badges/coverage.svg)](https://codeclimate.com/github/mumuki/mumukit-auth)


# Mumukit::Auth

> Ruby gem for handling user permissions within Mumuki

## Core Components

### Slugs

Slugs are identifier composed of up to two parts, separated by a slash, similar to Github's or DockerHub's slugs. 

Usage: 

```ruby

# Creation
Mumukit::Auth:Slug.new('first', 'second')
Mumukit::Auth:Slug.from_options(first: 'hello', second: 'world')
Mumukit::Auth:Slug.from_options(organization: 'hello', repository: 'world')

Mumukit::Auth:Slug.join('first', 'second')
Mumukit::Auth:Slug.join(first: 'first', second: 'second')
Mumukit::Auth:Slug.join('first') # answers the slug 'first/_' 

Mumukit::Auth:Slug.join_s('first', 'second') # answers the string 'first/second' 
Mumukit::Auth:Slug.join_s('first') # answers the string 'first/_' 

# Parsing
Mumukit::Auth:Slug.parse("hello/world")

# Convertion from and to string
"hello/world".to_mumukit_slug
Mumukit::Auth:Slug.new('foo', 'bar').to_s

# Matching
"hello/world".to_mumukit_slug == "hello/world".to_mumukit_slug
"hello/world".to_mumukit_slug.match_first 'hello'
"hello/world".to_mumukit_slug.match_second 'world'
```

### Grants
### Permissions
### Roles
### Token


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


