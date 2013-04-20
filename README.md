# Dumpster

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/garaio/dumpster)
[![Build Status](https://travis-ci.org/senny/dumpster.png?branch=master)](https://travis-ci.org/senny/dumpster)

Abstraction layer to export tabular data. Currently dumpster supports XLSX and CSV exports.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dumpster'
```

Or install it yourself as:

    $ gem install dumpster

## Usage

```ruby
data = [['col1-row1', 'col2-row1'], ['col1-row2', 'col2-row2']]
model = Dumpster::Model::Generic.new(data)

writer = Dumpster.csv_writer(model)
writer = Dumpster.csv_writer(model, :type => :windows)
writer = Dumpster.excel_writer(model)

writer.write_to_file('/some/directory/some.file')
```

### ActiveRecord

Dumpster ships with a `Dumpster::Model::ActiveRecordSql`. This model
allows you to execute arbitrary SQL through ActiveRecord to export the
result.

```ruby
model = Dumpster::Model::ActiveRecordSql.new('SELECT * from users')

writer = Dumpster.csv_writer(model) # for CSV output
writer = Dumpster.excel_writer(model) # for Excel output

writer.write_to_file('/some/directory/some.file')
```

## Contributing

Please read the [contribution guidelines](CONTRIBUTING.md) before
submitting code.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/3c3b77c78cbf66e966eb68440c8a992d "githalytics.com")](http://githalytics.com/senny/dumpster)
