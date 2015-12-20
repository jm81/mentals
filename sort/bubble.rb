#! /usr/bin/env ruby

# Reading http://www.sitepoint.com/sorting-algorithms-ruby/
module Sort
  module Bubble
    class << self
      def sort list, &block
        p list
        p inner_sort list, &block
        p "---"
      end

      def inner_sort list, &block
        length = list.length

        any_swapped, checks = false, 0

        (length - 1).times do |i|
          if block_given?
            result = yield list[i], list[i + 1]
          else
            result = list[i] > list[i + 1]
          end

          if result
            list[i], list[i + 1] = list[i + 1], list[i]
            any_swapped = true
          end
          checks += 1
        end

        p list
        checks += inner_sort list, &block if any_swapped
        checks
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
  Sort::Bubble.sort list
else
  Sort::Bubble.tests
end
