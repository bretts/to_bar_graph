module ToBarGraph

  class Bucketizer

    def initialize(data)
      @data = data
    end

    def create_buckets
      return create_buckets_from_hash if(@data.is_a?(Hash))

      return create_buckets_from_array if(@data.is_a?(Array))

      raise ArgumentError, "You need to provide either an Array or a Hash"
    end

    private
    def create_buckets_from_array
      buckets = {}
      
      @data.each do |e|
        buckets[e] ||= 0
        buckets[e] += 1
      end

      return buckets
    end

    def create_buckets_from_hash
      buckets = {}

      @data.each { |k, v| buckets[k] = v }
      
      if(buckets.any? { |k, v| v.is_a?(String) })
        return buckets.map { |k, v| [k, v.to_i] }.to_h
      end
      
      return buckets
    end

  end
end