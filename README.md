# Ruboty::QiitateamTemplate

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ruboty/qiitateam_template`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-qiitateam_template, :git => 'https://github.com/mizukmb/ruboty-qiitateam_template.git
```
## Usage

**Requre**
Set environment

```
export ORGANIZATION_NAME={your organization name}
export QIITA_ACCESS_TOKEN={your qiita access token}
```

How to get this

- organization neme -> your organization's URL
  - ex) `https://foobar.qiita.com/` <- `foobar` is organization name.
- qiita access token -> see: https://qiita.com/api/v2/docs#認証認可


### Create article

`test_bot /create template (?<id>\d+) *(?<coediting>coediting)?/`

For example

```
@foobar create template 10
```

Created article using template id 10.

You can article by coediting mode also.

```
@foobar create template 10 coediting
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mizukmb/ruboty-qiitateam_template.

