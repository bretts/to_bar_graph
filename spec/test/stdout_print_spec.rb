require 'stringio'
require_relative '../spec_helper'

describe "StdoutPrint" do

    describe "#invoke" do
        it 'should be able to display bar graphs based on array data' do
            output          = StringIO.new
            data            = array_data             = ["ice cream", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cookies", "cookies", "cookies", "cookies", "cookies", "cookies"]

            bar_graph       = ToBarGraph::BarGraph.new(data)    
            stdout_print    = ToBarGraph::StdoutPrint.new(bar_graph, output)
            stdout_print.invoke

            puts output.string

            expected_output = "\r**************************************************************\nResults for #to_bar_graph(print_info: true)\n\nData set Size: 64 items\nMin Value: 1, Max Value: 31\n**************************************************************\n\nCategory             Frequency              Percentage                   Bar Graph (each * =~ 1%) \n\nice cream            | 1                    | 1.5625                         | **                                                                                                    \npie                  | 31                   | 48.4375                        | *************************************************                                                     \ncake                 | 26                   | 40.6250                        | *****************************************                                                             \ncookies              | 6                    | 9.3750                         | **********                                                                                            \n"
            expect(output.string).to eq(expected_output)
        end

        it 'should be able to display bar graphs based on hash data' do
            output          = StringIO.new
            data            = { "pants"=> 15, "shoes"=> 34, "shirts"=> 67, "hats"=> 23 }

            bar_graph       = ToBarGraph::BarGraph.new(data)    
            stdout_print    = ToBarGraph::StdoutPrint.new(bar_graph, output)
            stdout_print.invoke

            puts output.string

            expected_output = "\r**************************************************************\nResults for #to_bar_graph(print_info: true)\n\nData set Size: 139 items\nMin Value: 15, Max Value: 67\n**************************************************************\n\nCategory             Frequency              Percentage                   Bar Graph (each * =~ 1%) \n\npants                | 15                   | 10.7914                        | ***********                                                                                           \nshoes                | 34                   | 24.4604                        | *************************                                                                             \nshirts               | 67                   | 48.2014                        | *************************************************                                                     \nhats                 | 23                   | 16.5468                        | *****************                                                                                     \n"
            expect(output.string).to eq(expected_output)
        end

        it 'should be able to display bar graphs based on hash data where the values are strings that can be cast into Fixnums' do
            output          = StringIO.new
            data            = { "bengal"=> "34", "sphynx"=> "22", "manx"=> "11", "cornish"=> "67" }

            bar_graph       = ToBarGraph::BarGraph.new(data)    
            stdout_print    = ToBarGraph::StdoutPrint.new(bar_graph, output)
            stdout_print.invoke

            puts output.string

            expected_output = "\r**************************************************************\nResults for #to_bar_graph(print_info: true)\n\nData set Size: 134 items\nMin Value: 11, Max Value: 67\n**************************************************************\n\nCategory             Frequency              Percentage                   Bar Graph (each * =~ 1%) \n\nbengal               | 34                   | 25.3731                        | **************************                                                                            \nsphynx               | 22                   | 16.4179                        | *****************                                                                                     \nmanx                 | 11                   | 8.2090                         | *********                                                                                             \ncornish              | 67                   | 50.0000                        | **************************************************                                                    \n"
            expect(output.string).to eq(expected_output)
        end

        it 'should adjust the category printf size for strings greater than 100 characters' do
            output          = StringIO.new
            data            = ["Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.8.9%20(KHTML,%20like%20Gecko)%20Version/7.1.8%20Safari/537.85.17","Mozilla/5.0%20(Windows%20NT%206.1;%20Trident/7.0;%20rv:11.0)%20like%20Gecko","Mozilla/5.0%20(Windows%20NT%206.1;%20Trident/7.0;%20rv:11.0)%20like%20Gecko","Mozilla/5.0%20(compatible;%20MSIE%209.0;%20Windows%20NT%206.1;%20Trident/5.0)","Dalvik/1.6.0%20(Linux;%20U;%20Android%204.4.2;%20LG-D802%20Build/KOT49I.D80220d)","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(iPad;%20CPU%20OS%208_4%20like%20Mac%20OS%20X)%20AppleWebKit/600.1.4%20(KHTML,%20like%20Gecko)%20Version/8.0%20Mobile/12H143%20Safari/600.1.4","Mozilla/5.0%20(iPad;%20CPU%20OS%208_4%20like%20Mac%20OS%20X)%20AppleWebKit/600.1.4%20(KHTML,%20like%20Gecko)%20Version/8.0%20Mobile/12H143%20Safari/600.1.4","Mozilla/5.0%20(Windows%20NT%206.1;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.93%20Safari/537.36","Mozilla/5.0%20(Windows%20NT%206.1;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.93%20Safari/537.36","Mozilla/5.0%20(Windows%20NT%2010.0;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.101%20Safari/537.36","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like%20Gecko)%20Version/5.1.9%20Safari/534.59.10","Dalvik/2.1.0%20(Linux;%20U;%20Android%205.0;%20SM-N900V%20Build/LRX21V)","Mozilla/5.0%20(Windows%20NT%206.1;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.93%20Safari/537.36","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.101%20Safari/537.36","Mozilla/5.0%20(Windows%20NT%2010.0;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.101%20Safari/537.36","Mozilla/5.0%20(Windows%20NT%2010.0;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.101%20Safari/537.36","Mozilla/5.0%20(Windows%20NT%2010.0;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/45.0.2454.101%20Safari/537.36","Mozilla/5.0%20(compatible;%20MSIE%2010.0;%20Windows%20NT%206.1;%20Trident/6.0)","Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%20Gecko)%20Version/7.1.3%20Safari/537.85.12","Mozilla/5.0%20(compatible;%20MSIE%2010.0;%20Windows%20NT%206.1;%20Trident/6.0)"]

            bar_graph       = ToBarGraph::BarGraph.new(data)    
            stdout_print    = ToBarGraph::StdoutPrint.new(bar_graph, output)
            stdout_print.invoke

            puts output.string

            expected_output = "\r**************************************************************\nResults for #to_bar_graph(print_info: true)\n\nData set Size: 39 items\nMin Value: 1, Max Value: 11\n**************************************************************\n\nCategory                                                                                             Frequency         Percentage    Bar Graph (each * =~ 1%) \n\nMozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.8.9%20(KHTML,%20like%20 | 1               | 2.5641          | ***                                                                                                   \nMozilla/5.0%20(Windows%20NT%206.1;%20Trident/7.0;%20rv:11.0)%20like%20Gecko                          | 2               | 5.1282          | ******                                                                                                \nMozilla/5.0%20(compatible;%20MSIE%209.0;%20Windows%20NT%206.1;%20Trident/5.0)                        | 1               | 2.5641          | ***                                                                                                   \nDalvik/1.6.0%20(Linux;%20U;%20Android%204.4.2;%20LG-D802%20Build/KOT49I.D80220d)                     | 1               | 2.5641          | ***                                                                                                   \nMozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_9_5)%20AppleWebKit/600.3.18%20(KHTML,%20like%2 | 11              | 28.2051         | *****************************                                                                         \nMozilla/5.0%20(iPad;%20CPU%20OS%208_4%20like%20Mac%20OS%20X)%20AppleWebKit/600.1.4%20(KHTML,%20like% | 2               | 5.1282          | ******                                                                                                \nMozilla/5.0%20(Windows%20NT%206.1;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/ | 3               | 7.6923          | ********                                                                                              \nMozilla/5.0%20(Windows%20NT%2010.0;%20WOW64)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome | 4               | 10.2564         | ***********                                                                                           \nMozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/534.59.10%20(KHTML,%20like% | 10              | 25.6410         | **************************                                                                            \nDalvik/2.1.0%20(Linux;%20U;%20Android%205.0;%20SM-N900V%20Build/LRX21V)                              | 1               | 2.5641          | ***                                                                                                   \nMozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_6_8)%20AppleWebKit/537.36%20(KHTML,%20like%20G | 1               | 2.5641          | ***                                                                                                   \nMozilla/5.0%20(compatible;%20MSIE%2010.0;%20Windows%20NT%206.1;%20Trident/6.0)                       | 2               | 5.1282          | ******                                                                                                \n"
            expect(output.string).to eq(expected_output)
        end

        xit 'should be able to display bar graphs for negative and positive values' do
        end

        xit 'should be able to display empty buckets' do
        end

        xit 'should not crash if sent an empty array' do
        end

        xit 'should not crash if the data provided is not bargraph-able' do
        end       
    end
end