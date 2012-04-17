require "dumpster/version"

require 'dumpster/model/generic'
require 'dumpster/model/sql'

module Dumpster

  def self.csv_writer(model, options = {})
    require 'dumpster/csv'
    writer_class = if options[:type] == :windows
                     Dumpster::CSV::WindowsWriter
                   else
                     Dumpster::CSV::Writer
                   end
    writer_class.new(model)
  end

  def self.excel_writer(model)
    require 'dumpster/excel'
    Dumpster::Excel::Writer.new(model)
  end

end
