require_relative './bar_graph'
require_relative './stdout_print'

['Array', 'Hash'].each do |c|
    eval "class #{Object.const_get(c)}; 
        def to_bar_graph(print_info: true); 
            bar_graph = ToBarGraph::BarGraph.new(self);
            stdout_print = ToBarGraph::StdoutPrint.new(bar_graph);
            stdout_print.invoke if print_info;
            return bar_graph;
        end;
    end"
end