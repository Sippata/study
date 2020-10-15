module Exercise
  module Arrays
    class << self
      def max(array)
        return nil if array.empty?
        max_item = array.first
        array.each do |item|
          max_item = item if item > max_item
        end
        max_item
      end

      def replace(array)
        new_array = []
        max_item = max array
        array.each do |item|
          new_array.push item > 0 ? max_item : item
        end
        new_array
      end

      def search(_array, _query)
        _search(_array, _query, 0, _array.length)
      end

      def _search(array, query, left, right)
        if left >= right
          return -1
        end
        middle = (left + right) / 2
        if query == array[middle]
          middle
        elsif query < array[middle]
          _search(array, query, left, middle)
        else
          _search(array, query, middle + 1, right)
        end
      end
    end
  end
end
