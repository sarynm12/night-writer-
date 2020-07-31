require './lib/night_read'
require 'pry'
#ruby ./lib/night_writer.rb message.txt braille.txt

  lines = File.open('message.txt', 'r')
  message = File.read(ARGV[0])
  characters_count = message.length
  letters = message.chars
  lines.close

  night_read = NightRead.new(letters)

  braille = night_read.translate_to_braille(letters)
  writer = File.open(ARGV[1], 'w')
  writer.write(braille)

  writer.close

  puts "Created #{ARGV[1]} containing #{characters_count} characters"
