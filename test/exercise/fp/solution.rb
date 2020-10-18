module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        ratings =
            _array.filter { |film| film["country"].split(",").length >= 2 unless film["country"].nil? }
                .map { |film| film["rating_kinopoisk"].to_f }
                .filter { |rating| rating > 0 }
        rating_sum = ratings.reduce(:+)
        rating_sum / ratings.length
      end

      def chars_count(_films, _threshold)
        desired_char = 'и'
        _films.filter_map { |film| film["name"] if film["rating_kinopoisk"].to_f >= _threshold }
            .reduce(0) { |acc, name| acc + name.count(desired_char) }
      end
    end
  end
end
