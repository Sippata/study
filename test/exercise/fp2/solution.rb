module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        for item in self
          block.call(item)
        end
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_array = MyArray.new
        my_each { |item| new_array << block.call(item) }
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new
        my_each { |item| new_array << item unless item.nil? }
        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        index = 0
        if acc.nil?
          ignore_first = true
          acc = self[0]
        end
        my_each do |item|
          if ignore_first && index.zero?
            index += 1
          else
            acc = block.call(acc, item)
            index += 1
          end
        end
        acc
      end
    end
  end
end
