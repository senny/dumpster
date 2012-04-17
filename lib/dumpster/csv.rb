require 'csv'

module Dumpster
  module CSV

    class Writer
      def initialize(model)
        @model = model
      end

      def write_to_file(path)
        File.open(path, 'w+') do |file|
          write_to file
        end
      end

      def write_to(io)
        csv = build_csv(io)
        @model.each do |row|
          csv << row
        end
      end

      def build_csv(io)
        ::CSV.new(io, csv_options)
      end

      def csv_options
        {}
      end
    end

    class WindowsWriter < Writer
      def csv_options
        {:col_sep => ';'}
      end
    end

  end
end
