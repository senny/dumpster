require 'axlsx'

module Dumpster
  module Excel
    class Writer

      def initialize(model)
        @model = model
      end

      def write_to_file(path)
        package = Axlsx::Package.new
        workbook = package.workbook
        workbook.add_worksheet(:name => "Worksheet 1") do |sheet|
          @model.each do |row|
            sheet.add_row(row)
          end
        end
        package.serialize(path)
      end


    end
  end
end
