module ToBarGraph

  class StdoutPrint

    def initialize(bar_graph, stdout=$stdout, show_header: true)
      @bar_graph      = bar_graph
      @stdout         = stdout
      @show_header    = show_header
    end

    def invoke      
      if @bar_graph.length == 0
        @stdout.puts "You have no bar graph data"
      elsif !(@bar_graph.buckets.is_a?(Hash))
        @stdout.puts "The data you have provided is not bargraph-able" 
      else
        print_header if @show_header
        print_body
      end
    end

    private
    def print_header
      @stdout.print "\r**************************************************************\n"
      @stdout.puts "Results for #to_bar_graph(print_info: true, print_header: #{@show_header})"
      @stdout.puts "\n"

      @stdout.puts "Data set Size: #{@bar_graph.bucket_contents_length} items"

      @stdout.puts "Min Value: #{@bar_graph.min_value}, Max Value: #{@bar_graph.max_value}"
      @stdout.puts "**************************************************************\n\n"
    end

    def print_body
      cata      = '%-20s'
      freq      = '%-20s'
      prec      = '%-30s'
      star      = '%-20s'
      cata_sig  = '%.20s'

      longest_category_name = begin @bar_graph.longest_category_name.length; rescue; return 10; end
      if longest_category_name >= 50
        cata      = '%-100s'
        cata_sig  = '%.100s'
        freq      = '%-15s'
        prec      = '%-15s'
      else
        cata      = '%-20s'
        cata_sig  = '%.20s'
      end

      @stdout.printf("#{cata} #{freq} #{prec} #{star} \n\n", "Category", "Frequency", "  Percentage", "Bar Graph (each * =~ 1%)")
    
      @bar_graph.each do |k, v|
        category    = "#{k}"
        frequency   = v
        percentage  = ((frequency.to_f / @bar_graph.bucket_contents_length) * 100)
        stars       = ''

        percentage.ceil.times { |x| stars << '*' }
        stars.length.upto(100) { |x| stars << ' ' }

        @stdout.printf("#{cata} | #{freq} | #{prec} | #{star} \n", ("#{cata_sig}" % category), frequency, ('%.4f' % percentage), stars)
      end
    end

  end
end