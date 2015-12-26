#! /usr/bin/env ruby

# http://www.learnalgorithms.in/
module Sort
  class Insertion
    def initialize list, &block
      @list = list
      @block = block
    end

    def sort
      list = @list.dup
      p list

      (1...list.length).each do |index|
        value = list[index]

        sorting_index = index

        while sorting_index > 0
          if @block
            result = @block.call list[sorting_index - 1], value
          else
            result = list[sorting_index - 1] > value
          end
          break unless result

          list[sorting_index] = list[sorting_index - 1]
          sorting_index -= 1
        end

        list[sorting_index] = value
        p list

      end

      p "---"
    end

    class << self
      def sort list, &block
        new(list, &block).sort
      end

      def tests
        sort [6, 1, -9, 22, 14, 3]
        sort [5, 4, 3, 2, 1]
        sort [1, 2, 3, 5, 4]
        sort [1, 2, 3, 5, 4] { |a, b| a < b } # Reversed
        sort (0..99).to_a.shuffle.take(30)
      end
    end
  end
end

if ARGV.length > 0
  list = ARGV.map(&:to_i)
  Sort::Insertion.sort list
else
  Sort::Insertion.tests
end
