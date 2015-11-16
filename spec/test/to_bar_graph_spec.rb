require_relative '../spec_helper'

describe 'ToBarGraph' do
   
    describe "to_bar_graph" do
        it 'return a bar when provided an array' do
            data = ["ice cream", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cookies", "cookies", "cookies", "cookies", "cookies", "cookies"]

            bar_graph = data.to_bar_graph
            
            expect(bar_graph.length).to eq(4)
        end

        it 'return a bar graph when provided an hash' do
            data = { "pants"=> 15, "shoes"=> 34, "shirts"=> 67, "hats"=> 23 }

            bar_graph = data.to_bar_graph

            expect(bar_graph.length).to eq(4)
        end
    end
end




