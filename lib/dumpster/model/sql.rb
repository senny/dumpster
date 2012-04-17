module Dumpster
  module Model
    class Sql

      def initialize(connection, sql)
        @connection = connection
        @sql = sql
      end

      def each(&block)
        @connection.select_rows(@sql).each(&block)
      end

    end
  end
end
