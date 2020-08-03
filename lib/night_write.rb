require './lib/night_writer'

input = File.open(ARGV[0], 'r')
contents = input.read
input.close
