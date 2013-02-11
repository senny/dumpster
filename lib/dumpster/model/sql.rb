module Dumpster
  module Model
    class ActiveRecordSql

      def initialize(sql, connection = ActiveRecord::Base.connection)
        @sql = sql
        @connection = connection
      end

      def each(&block)
        @connection.select_rows(@sql).each(&block)
      end

    end
  end
end
