require 'axlsx'

module Dumpster
  module Excel
    class Writer
      def initialize(model)
        @model = model
      end

      def write_to_string
        file = Tempfile.new('dumpster_excel_export.xlsx')
        write_to_file(file.path)
        File.read(file.path)
      end

      def write_to_file(path)
        package = Axlsx::Package.new
        draw(package)
        package.serialize(path)
      end

      def draw(package)
        package.workbook.add_worksheet(:name => "Worksheet 1") do |sheet|
          @model.each do |row|
            sheet.add_row(row)
          end
        end
      end
    end

    module AutoFilter
      def draw(*args)
        sheet = super
        sheet.add_table sheet.dimension.sqref
        sheet
      end
    end
  end
end
