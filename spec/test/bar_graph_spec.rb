require_relative '../spec_helper'

describe 'BarGraph' do
    before :all do
        @array_data = ["ice cream", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cookies", "cookies", "cookies", "cookies", "cookies", "cookies"]
    end
    
    describe "#each" do
        it 'should yield bucket objects' do
            bar_graph = ToBarGraph::BarGraph.new(@array_data)
            
            bar_graph.each { |i| expect(i.class).to eq(Array) }
            bar_graph.each { |k, v| expect(k.class).to eq(String) }
            bar_graph.each { |k, v| expect(v.class).to eq(Fixnum) }
        end
    end

    describe "#[]" do
        it 'should return a bucket at the key' do
            bar_graph = ToBarGraph::BarGraph.new(@array_data)
            
            expect(bar_graph["pie"]).to eq(31)
        end
    end

    describe "#length" do
        it 'should return the number of buckets' do
            bar_graph = ToBarGraph::BarGraph.new(@array_data)
            
            expect(bar_graph.length).to eq(4)
        end
    end
end