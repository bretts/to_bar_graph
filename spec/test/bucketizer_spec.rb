require_relative '../spec_helper'

describe 'Bucketizer' do
   
    describe "#create_buckets" do
        before :all do
            @array_data             = ["ice cream", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cookies", "cookies", "cookies", "cookies", "cookies", "cookies"]
            @hash_data              = { "pants"=> 15, "shoes"=> 34, "shirts"=> 67, "hats"=> 23 }
            @hash_data_with_strings = { "bengal"=> "34", "sphynx"=> "22", "manx"=> "11", "cornish"=> "67" }
        end

        it 'should return a hash of buckets if provided an array' do
            bucketizer = ToBarGraph::Bucketizer.new(@array_data)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(4)
            expect(buckets["ice cream"]).to eq(1)
            expect(buckets["pie"]).to eq(31)
            expect(buckets["cake"]).to eq(26)
            expect(buckets["cookies"]).to eq(6)
        end

        it 'should return a hash of buckets if provided a hash' do
            bucketizer = ToBarGraph::Bucketizer.new(@hash_data)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(4)
            expect(buckets["pants"]).to eq(15)
            expect(buckets["shoes"]).to eq(34)
            expect(buckets["shirts"]).to eq(67)
            expect(buckets["hats"]).to eq(23)
        end

         it 'should return a hash of buckets with integer values if provided a hash with string values' do
            bucketizer = ToBarGraph::Bucketizer.new(@hash_data_with_strings)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(4)
            expect(buckets["bengal"]).to eq(34)
            expect(buckets["sphynx"]).to eq(22)
            expect(buckets["manx"]).to eq(11)
            expect(buckets["cornish"]).to eq(67)
        end

        it 'should not crash if the array is empty' do
            bucketizer = ToBarGraph::Bucketizer.new([])
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(0)
        end

        it 'should not crash if the hash is empty' do
            bucketizer = ToBarGraph::Bucketizer.new({})
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(0)
        end

        it 'should remove nil values from arrays' do
            data_with_nil_values = @array_data.dup
            data_with_nil_values << [nil, "stuff", nil, "stuff"]
            data_with_nil_values.flatten!

            bucketizer = ToBarGraph::Bucketizer.new(data_with_nil_values)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(5)
            expect(buckets["ice cream"]).to eq(1)
            expect(buckets["pie"]).to eq(31)
            expect(buckets["cake"]).to eq(26)
            expect(buckets["cookies"]).to eq(6)
            expect(buckets["stuff"]).to eq(2)
            expect(buckets[nil]).to eq(nil)
        end

        it 'should remove nil keys from hashes' do
            data_with_nil_values = @hash_data.dup
            data_with_nil_values[nil] = 25
            bucketizer = ToBarGraph::Bucketizer.new(data_with_nil_values)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(4)
            expect(buckets["pants"]).to eq(15)
            expect(buckets["shoes"]).to eq(34)
            expect(buckets["shirts"]).to eq(67)
            expect(buckets["hats"]).to eq(23)
            expect(buckets[nil]).to eq(nil)
        end

        it 'should remove nil values from hashes' do
            data_with_nil_values = @hash_data.dup
            data_with_nil_values["gloves"] = nil
            bucketizer = ToBarGraph::Bucketizer.new(data_with_nil_values)
            buckets = bucketizer.create_buckets

            expect(buckets.length).to eq(4)
            expect(buckets["pants"]).to eq(15)
            expect(buckets["shoes"]).to eq(34)
            expect(buckets["shirts"]).to eq(67)
            expect(buckets["hats"]).to eq(23)
            expect(buckets["gloves"]).to eq(nil)
        end

        xit 'should allow for and take into account negative numbers' do
        end

        xit 'should add empty buckets when there are no elements within the bucket' do
        end
    end
end




