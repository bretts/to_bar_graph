ToBarGraph
===========

PURPOSE
-------
The purpose of this program is to take an Array of strings or a Hash like: { value_1 => 10, value_2 => 46 ... } and print out a very simple command line bar graph for it.

FEATURES
--------
Adds #to_bar_graph to Array and to Hash

EXAMPLE USAGE
-------------
        1) gem install to_bar_graph

        2) require 'to_bar_graph'

        3) bar_graph = ["ice cream", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "pie", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cake", "cookies", "cookies", "cookies", "cookies", "cookies", "cookies"].to_bar_graph

        OR

        bar_graph = ({ "pants"=> 15, "shoes"=> 34, "shirts"=> 67, "hats"=> 23 }).to_bar_graph

        4) That's it