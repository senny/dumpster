# Dumpster

Abstraktion für den Export von Daten in Tabellenform. Momentan werden die Formate
CSV und XLSX unterstützt.

## Installation

Add this line to your application's Gemfile:

    gem 'dumpster'

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
