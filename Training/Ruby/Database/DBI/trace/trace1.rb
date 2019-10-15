require 'dbi/trace'

mode = 1 #0=off, 1,2,3

file = File.open('debug_output.log', 'a')

destination = file
trace(mode, destination)
