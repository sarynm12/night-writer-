require './lib/night_read'
require 'pry'
#ruby ./lib/night_writer.rb message.txt braille.txt

  lines = File.open('message.txt', 'r')
  message = File.read(ARGV[0])
  characters_count = message.length
  lines.close

  night_read = NightRead.new(message)
  night_read.split_message
  braille = night_read.translate_to_braille
  writer = File.open(ARGV[1], 'w')
  writer.write(braille)
  #writer.write(night_read.outgoing_text)

  writer.close

  puts "Created #{ARGV[1]} containing #{characters_count} characters"
