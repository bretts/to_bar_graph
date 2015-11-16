require_relative './bucketizer'

module ToBarGraph

  class BarGraph
    include Enumerable

    def initialize(array)
      bucketizer  = Bucketizer.new(array)
      @buckets    = bucketizer.create_buckets
    end
    attr_reader :buckets

    def each(&block)
      @buckets.each do |b|
        yield b
      end
    end

    def [](key)
      return @buckets[key]
    end

    def length
      return @buckets.length
    end

    def min_value
      return @buckets.min_by { |k, v| @buckets[k] }[1]
    end

    def max_value
      return (@buckets.max_by { |k, v| @buckets[k] })[1]
    end

    def bucket_contents_length
      @buckets.reduce(0) { |sum, x| sum + x[1] }
    end

    def longest_category_name
      longest = ''

      @buckets.each { |h| longest = h[0] if (h[0].length > longest.length) }

      return (longest == '') ? 0 : longest
    end

    def inspect
      return "class: #{self.class} object_id: #{self.object_id}"
    end

  end
end