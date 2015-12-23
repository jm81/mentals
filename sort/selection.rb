#! /usr/bin/env ruby

# http://www.learnalgorithms.in/
module Sort
  module Selection
    class << self
      def sort list, &block
        p list
        length = list.length

        (length - 1).times do |i|
          min = i
          (i + 1).upto(length - 1) do |j|
            if block_given?
              result = yield list[min], list[j]
            else
              result = list[min] > list[j]
            end

            min = j if result
          end
          list[i], list[min] = list[min], list[i]

          p list
        end

        p "---"
      end

      def tests
        sort [6, 1, -9, 22, 14, 3]
        sort [5, 4, 3, 2, 1]
        sort [1, 2, 3, 5, 4]
        sort [1, 2, 3, 5, 4] { |a, b| a < b } # Reversed
      end
    end
  end
end

if ARGV.length > 0
  list = ARGV.map(&:to_i)
  Sort::Selection.sort list
else
  Sort::Selection.tests
end
