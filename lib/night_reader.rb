require './lib/reverse'
require 'pry'
# ruby ./lib/night_reader.rb braille.txt original_message.txt
lines = File.open('message.txt', 'r')
message = File.read(ARGV[0]).chomp
characters_count = message.length
lines.close

reverse = Reverse.new(message)

english = reverse.braille_to_english

writer = File.open(ARGV[1], 'w')

writer.write(english)

writer.close

puts "Created #{ARGV[1]} containing #{characters_count} characters"
