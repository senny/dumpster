module Dumpster
  module Model
    class Generic

      def initialize(data)
        @data = data
      end

      def each(&block)
        @data.each(&block)
      end

    end
  end
end
